import HelloWorld from './hello-world';

describe('Hello World', () => {
  const helloWorld = new HelloWorld();

  it('says hello world with no name', () => {
    expect(helloWorld.hello()).toEqual('Hello, World!');
  });

  it('says hello to bob', () => {
    expect(helloWorld.hello('Bob')).toEqual('Hello, Bob!');
  });

  it('says hello to sally', () => {
    expect(helloWorld.hello('Sally')).toEqual('Hello, Sally!');
  });
});

