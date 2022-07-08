---
title: typeinferred-use-swr-codegen
date: 2022-07-08
tags: [ts]
---

```typescript
import useSWR from "swr";
import { request } from "graphql-request";

import type { TypedDocumentNode } from "@graphql-typed-document-node/core";
import type { DocumentNode } from "graphql";

const fetcher = (query: DocumentNode, variables: unknown) =>
  request("https://endpoint.com", query, variables);

// this interface creates type inference from the DocumentNode
// being passed as the query: key
interface GQLArgs<Data = any, Variables = Object> {
  query: DocumentNode | TypedDocumentNode<Data, Variables>;
  variables?: Variables;
}

export function useGQL<D = any, V = Object>(args: GQLArgs<D, V>) {
  const swr = useSWR<D>([args.query, args.variables], fetcher);
  return swr;
}

export function ssrGQL<D = any, V = Object>(args: GQLArgs<D, V>) {
  const ssrData = request<D>(
    "https://endpoint.com",
    args.query,
    args.variables
  );
  return ssrData;
}
```


codegen yaml
```yaml
overwrite: true
schema:
  - "https://endpoint.com"
documents: "./src/**/*.graphql"
generates:
  ./src/components/:
    preset: near-operation-file
    presetConfig:
      extension: .generated.ts
      baseTypesPath: "~~/core/types/gql.generated" # the double tilde is a hack to align with tsconfig path alias lol
    plugins:
      - typescript-operations
      - typed-document-node
  ./src/core/types/gql.generated.ts:
    plugins:
      - typescript
    config:
      useTypeImports: true

```
