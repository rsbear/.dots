---
title: type empty hashmap init
date: 2022-06-28
tags: [ts]
---

``` typescript
type THashMap = {
  id: string // doesnt matter if undefined or not
	//.... properties
}
const hashMap = <THashMap>{}
```
