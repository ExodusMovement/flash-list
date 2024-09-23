**Fast & performant React Native list. No more blank cells.**

Swap from FlatList in seconds. Get instant performance.

</div>

## Installation

Add the package to your project via `yarn add @shopify/flash-list` and run `pod install` in the `ios` directory.

## Usage

We recommend reading the detailed documentation for using `FlashList`.

But if you are familiar with [FlatList](https://reactnative.dev/docs/flatlist), you already know how to use `FlashList`. You can try out `FlashList` by changing the component name and adding the `estimatedItemSize` prop or refer to the example below:

```jsx
import React from "react";
import { View, Text } from "react-native";
import { FlashList } from "@shopify/flash-list";

const DATA = [
  {
    title: "First Item",
  },
  {
    title: "Second Item",
  },
];

const MyList = () => {
  return (
    <FlashList
      data={DATA}
      renderItem={({ item }) => <Text>{item.title}</Text>}
      estimatedItemSize={200}
    />
  );
};
```

To avoid common pitfalls, you can also follow these steps for migrating from `FlatList`, based on our own experiences:

1. Switch from `FlatList` to `FlashList` and render the list once. You should see a warning about missing `estimatedItemSize` and a suggestion. Set this value as the prop directly.
2. **Important**: Scan your `renderItem` hierarchy for explicit `key` prop definitions and remove them. If you’re doing a `.map()` use indices as keys.
3. Check your `renderItem` hierarchy for components that make use of `useState` and verify whether that state would need to be reset if a different item is passed to that component (see `Recycling`)
4. If your list has heterogenous views, pass their types to `FlashList` using `getItemType` prop to improve performance.
5. Do not test performance with JS dev mode on. Make sure you’re in release mode. `FlashList` can appear slower while in dev mode due to a small render buffer.

## App / Playground

The `fixture` is an example app showing how to use the library.
