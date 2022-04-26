/// <reference path="./global.d.ts" />

import { Untranslatable } from "./errors";

// @ts-check

export class TranslationService {
  /**
   * Creates a new service
   * @param {ExternalApi} api the original api
   */
  constructor(api) {
    this.api = api;
  }

  /**
   * Attempts to retrieve the translation for the given text.
   *
   * - Returns whichever translation can be retrieved, regardless the quality
   * - Forwards any error from the translation api
   *
   * @param {string} text
   * @returns {Promise<string>}
   */
  async free(text) {
    const response = await this.api.fetch(text);
    return response.translation;
  }

  /**
   * Batch translates the given texts using the free service.
   *
   * - Resolves all the translations (in the same order), if they all succeed
   * - Rejects with the first error that is encountered
   * - Rejects with a BatchIsEmpty error if no texts are given
   *
   * @param {string[]} texts
   * @returns {Promise<string[]>}
   */
  async batch(texts) {
    if (texts.length === 0) {
      throw new BatchIsEmpty();
    }

    return Promise.all(texts.map((text) => this.free(text)));
  }

  /**
   * Requests the service for some text to be translated.
   *
   * Note: the request service is flaky, and it may take up to three times for
   *       it to accept the request.
   *
   * @param {string} text
   * @returns {Promise<void>}
   */
  request(text) {
    return new Promise((resolve, reject) => {
      const callback = (attempt, err) => {
        if (err === undefined) {
          resolve(undefined);
        } else if (attempt === 3 && err) {
          reject(err);
        } else if (attempt === 3) {
          reject(new Untranslatable());
        } else {
          this.api.request(text, callback.bind(this, attempt + 1));
        }
      };

      this.api.request(text, callback.bind(this, 1));
    });
  }

  /**
   * Retrieves the translation for the given text
   *
   * - Rejects with an error if the quality can not be met
   * - Requests a translation if the translation is not available, then retries
   *
   * @param {string} text
   * @param {number} minimumQuality
   * @returns {Promise<string>}
   */
  async premium(text, minimumQuality) {
    return new Promise(async (resolve, reject) => {
      const fetchTranslation = async () => {
        const response = await this.api.fetch(text);
        if (response.quality < minimumQuality) {
          reject(new QualityThresholdNotMet());
        }

        resolve(response.translation);
      };

      try {
        await fetchTranslation();
      } catch {
        this.api.request(text, async (err) => {
          if (err === undefined) {
            await fetchTranslation();
          } else {
            reject(err);
          }
        });
      }
    });
  }
}

/**
 * This error is used to indicate a translation was found, but its quality does
 * not meet a certain threshold. Do not change the name of this error.
 */
export class QualityThresholdNotMet extends Error {
  /**
   * @param {string} text
   */
  constructor(text) {
    super(
      `
The translation of ${text} does not meet the requested quality threshold.
    `.trim()
    );

    this.text = text;
  }
}

/**
 * This error is used to indicate the batch service was called without any
 * texts to translate (it was empty). Do not change the name of this error.
 */
export class BatchIsEmpty extends Error {
  constructor() {
    super(
      `
Requested a batch translation, but there are no texts in the batch.
    `.trim()
    );
  }
}
