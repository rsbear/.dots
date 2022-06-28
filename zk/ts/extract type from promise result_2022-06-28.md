---
title: extract type from promise result
date: 2022-06-28
tags: [ts]
---

Say you're return a promise from the following async requests. You have a type for `items` 

type Items = Array<{
  id: string
	slug: string
}>

```
const result = Promise.all(items?.map(async (x) => {
  const dataForItem = await fetch("/endpoint/${x.slug}")

	return {
	  id: dataForItem?.id
		name: dataForItem?.name
	}
}))
```

We can infer the response of the map iteration function and extract it into something reusable.

```
type ResultsPromise = Awaited<typeof result>
```


