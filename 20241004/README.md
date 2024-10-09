# Problem: Flatten a Nested Dictionary

## Description

Write a function to flatten a nested dictionary. The keys should be namespaced using a period (`.`).

### Example:

Given the following dictionary:

```{
    "key": 3,
    "foo": {
      "a": 5,
      "bar": {"baz": 8}
    }
  }
```


The flattened version should become:

`{ "key": 3, "foo.a": 5, "foo.bar.baz": 8 }`


### Assumptions:

- You can assume that keys in the original dictionary do not contain dots, so no key collision will occur during the flattening process.

### Input:

- A nested dictionary with keys as strings and values that could be either integers or other dictionaries.

### Output:

- A flattened dictionary where the nested keys are concatenated using periods as namespaces.
