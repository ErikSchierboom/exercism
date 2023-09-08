type EqualFn<T> = (lhs: T, rhs: T) => boolean;
type GetterFn<T> = () => T;
type SetterFn<T> = (value: T) => T;
type UnsubscribeFn = () => void;
type UpdateFn<T> = (value?: T) => T;

type InputPair<T> = [GetterFn<T>, SetterFn<T>];

type ObserverStatus = "active" | "inactive" | "pending";

type Observer<T> = {
  value?: T;
  updateFn: UpdateFn<T>;
  observers: Set<Observer<T>>;
  equalFn?: EqualFn<T>;
  active: boolean;
  changed: boolean;
};

type Subject<T> = {
  observers: Set<Observer<T>>;
  value: T;
  equalFn?: EqualFn<T>;
};

const strictEquals = <T>(a: T, b: T) => a === b;

let activeObserver: Observer<any>;

function updateObserver<T>(observer: Observer<T>): void {
  observer.changed = false;
  if (!observer.active) return;
  const prevObserver = activeObserver;
  activeObserver = observer;
  const previousValue = observer.value as T;
  observer.value = observer.updateFn(observer.value);
  activeObserver = prevObserver;
  const cmp = observer.equalFn ?? strictEquals;
  observer.changed = !cmp(previousValue, observer.value);
}

function createInput<T>(value: T, _equal?: boolean | EqualFn<T>): InputPair<T> {
  const s: Subject<T> = {
    observers: new Set<Observer<T>>(),
    value,
    equalFn: undefined,
  };

  const read: GetterFn<T> = () => {
    if (activeObserver) s.observers.add(activeObserver);
    return s.value;
  };

  const write: SetterFn<T> = (newValue) => {
    s.value = newValue;
    const subs = new Set(s.observers);

    subs.forEach((o) => {
      o.observers.forEach((o2) => {
        if (subs.has(o2)) {
          subs.delete(o2);
        }
        subs.add(o2);
      });
    });

    subs.forEach((o) => {
      updateObserver(o);
      if (Boolean(o.equalFn) && !o.changed) {
        o.observers.forEach((o2) => subs.delete(o2));
      }
    });

    return s.value;
  };

  return [read, write];
}

function createComputed<T>(
  updateFn: UpdateFn<T>,
  value?: T,
  equalFn?: boolean | EqualFn<T>
): GetterFn<T> {
  const o: Observer<T> = {
    value,
    updateFn,
    observers: new Set(),
    equalFn:
      (equalFn || undefined) &&
      (typeof equalFn === "function" ? equalFn : (a, b) => a === b),
    active: true,
    changed: false,
  };
  updateObserver(o);
  return (): T => {
    if (activeObserver) {
      o.observers.add(activeObserver);
    }
    return o.value as T;
  };
}

function createCallback<T>(updateFn: UpdateFn<T>, value?: T): UnsubscribeFn {
  const observer: Observer<T> = {
    value,
    updateFn,
    observers: new Set<Observer<T>>(),
    active: true,
    changed: false,
  };
  updateObserver(observer);

  return () => {
    observer.active = false;
  };
}

export { createInput, createComputed, createCallback };
