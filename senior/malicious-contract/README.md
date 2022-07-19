# Malicious Contracts

## Prevention

Create a new contract, instead of typecasting an address into a contract inside the constructor.

````contract Good {
    Helper public helper;
    constructor() {
        helper = new Helper();
    }```
````
