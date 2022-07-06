---
title: i wish useGQL
date: 2022-07-05
tags: [ts]
---

All of this rant pertains to frontend codebases graphql problems

I love/hate graphql codegen, maintaining graphql files generally sucks and its tough to scale with big schemas or sites with a ton of data going in and out. Basically I can't use LSP go to definition in a graphql file. If you're generating function hooks from the name of a gql doc, how the hell are you supposed to remember what the name of the function is..

I wish there was a hook like this where we didn't have to use graphql files or write queries and mutations in template lieterals

```typescript
const { data } = useGQL({ query: "getNews", {
  variables: {
	  category: state.variable,
		limit: state.limit,
	},
	fields: {
	  title: "string",
		likes: "number",
		author: {
		  fullName: "string",
			email: "string",
		}
	},
	options: {
	  cacheTtl: 60,
		swr: true,
		refetchOnMount: true,
	  // ..etc
	}
}})
```

about that hook 
1. the `query` key has union type value, any query that exists within your API's schema. Same concept would work for mutations
2. `fields` is the response fields where each key gets a scalar union if it's a primitive type. Unless it's a related object
3. options should be an extension of react-query or useSWR




