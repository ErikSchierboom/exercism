#include "circular_buffer.h"

#include <errno.h>

 struct circular_buffer_t {
    size_t read_idx;
    size_t write_idx;
    size_t count;
    size_t capacity;
    buffer_value_t* buffer;
};

circular_buffer_t* new_circular_buffer(int capacity) {
    circular_buffer_t* buffer = (circular_buffer_t*)malloc(sizeof(circular_buffer_t));
    buffer->read_idx = 0;
    buffer->write_idx = 0;
    buffer->count = 0;
    buffer->capacity = capacity;
    buffer->buffer = malloc(sizeof(int) * capacity);
    return buffer;
}

buffer_status_t write(circular_buffer_t* buffer, int value) {
    if (buffer->count == buffer->capacity) {
        errno = ENOBUFS;
        return EXIT_FAILURE;
    }

    buffer->buffer[buffer->write_idx] = value;
    buffer->write_idx = (buffer->write_idx + 1) % buffer->capacity;
    buffer->count++;

    return EXIT_SUCCESS;
}

buffer_status_t overwrite(circular_buffer_t* buffer, int value) {
    buffer_value_t dummy;
    if (buffer->count == buffer->capacity) read(buffer, &dummy);
    write(buffer, value);

    return EXIT_SUCCESS;
}

buffer_status_t read(circular_buffer_t* buffer, buffer_value_t* read_value) {
    if (buffer->count == 0) {
        errno = ENODATA;
        return EXIT_FAILURE;
    }

    *read_value = buffer->buffer[buffer->read_idx];
    buffer->read_idx = (buffer->read_idx + 1) % buffer->capacity;
    buffer->count--;

    return EXIT_SUCCESS;
}

void clear_buffer(circular_buffer_t* buffer) {
    buffer->count = 0;
    buffer->read_idx = 0;
    buffer->write_idx = 0;
}

void delete_buffer(circular_buffer_t* buffer) {
    free(buffer);
}
