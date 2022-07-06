# React

React is the most commonly used framework for building dApps
You can create JS functions that return HTML

Components are written in JSX and return HTML
ex.

```function ShoppingList() {
    const items = ["Apples", "Bananas", "Grapes"]

    return (
      <div className="shopping-list">
        <h1>Shopping List</h1>
        <ul>
            {items.map((item, index) => <li key={index}>{item}</li>)}
        </ul>
      </div>
    );
}
```

Composition is embedding components inside of components to create a single hierarchial HTML document. Code is easier to understand by enabling resusability through data passing.
