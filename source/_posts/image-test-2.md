---
title: image-test-2
date: 2020-08-14 10:34:42
tags:
---

# Image test

![](2020-08-14-10-19-55.png)

```python
def repeat_n(n, p):
    solution = ""
    length = len(p)
    for i in range(n):
        pos = i % length
        solution+= p[pos]
    return solution

assert repeat_n(3, "01") == "010"
assert repeat_n(5, "") == ""
assert repeat_n(10, "abc") == "abcabcabca"
print("Assertions passed!")
```