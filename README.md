# Test for the language string issue in mu-cl-resource

Link to the issue on Github: [https://github.com/mu-semtech/mu-cl-resources/issues/11](https://github.com/mu-semtech/mu-cl-resources/issues/11)

### Version v1.15.0
In this version `language-string` is not introduced yet and mu-cl-resources treats it as boolean.

Data:
```json
{
  "data":{
    "attributes":{
      "name":[
        {
          "content":"Ritz",
          "language":"en"
        }
      ],
      "description":[
        {
          "content":"Lorem ipsum dolor sit amet.",
          "language":"en"
        }
      ],
      "test":{
        "content":"test",
        "language":"en"
      }
    },
    "type":"hotels"
  }
}
```

Curl call to create resource:
```bash
curl -X POST http://localhost:500/hotels --data '{ "data":{ "attributes":{ "name":[{ "content":"Ritz", "language":"en" }], "description":[{ "content":"Lorem ipsum dolor sit amet.", "language":"en" }], "test":{ "content":"test", "language":"en" }}, "type":"hotels" }}' -H "Content-Type: application/vnd.api+json"
```
Logs:
``` bash
 ==Executing query==
 PREFIX ext: <http://mu.semte.ch/vocabularies/ext/>
 PREFIX pdt: <http://xdc.tenforce.com/taxonomy/personal-data/>
 PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
 PREFIX dcat: <http://www.w3.org/ns/dcat#>
 PREFIX tf: <http://xdc.tenforce.com/elements/>
 PREFIX dct: <http://purl.org/dc/terms/>
 PREFIX foaf: <http://xmlns.com/foaf/0.1/>
 PREFIX rm: <http://mu.semte.ch/vocabularies/logical-delete/>
 PREFIX typedLiterals: <http://mu.semte.ch/vocabularies/typed-literals/>
 PREFIX mu: <http://mu.semte.ch/vocabularies/core/>
 PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
 PREFIX app: <http://mu.semte.ch/app/>
 PREFIX owl: <http://www.w3.org/2002/07/owl#>
 PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
 INSERT DATA
 {
     GRAPH <http://mu.semte.ch/application> {
         <http:/test-url.be/hotels/5CA344464B789A0008000001> a ext:Hotel.
     <http:/test-url.be/hotels/5CA344464B789A0008000001> mu:uuid "5CA344464B789A0008000001".
     <http:/test-url.be/hotels/5CA344464B789A0008000001> dct:title "Ritz"@en.   
     <http:/test-url.be/hotels/5CA344464B789A0008000001> dct:description "Lorem ipsum dolor sit amet."@en.
     <http:/test-url.be/hotels/5CA344464B789A0008000001> dct:test "true"^^typedLiterals:boolean.
 }
 }
 ```


## Versions starting from v1.16.0
Based on this [commit](https://github.com/mu-semtech/mu-cl-resources/commit/707bdb8b4af9d383d5986ad136da13b43c7be964) and this [version release notes](https://github.com/mu-semtech/mu-cl-resources/releases/tag/v1.16.0) `language-string` was just introduced in v1.16.0 as a new feature. From this version and in later versions `language-string` is handled properly.


### Create resource


Data:
```json
{
  "data":{
    "attributes":{
      "name":[
        {
          "content":"Ritz",
          "language":"en"
        }
      ],
      "description":[
        {
          "content":"Lorem ipsum dolor sit amet.",
          "language":"en"
        }
      ],
      "test":{
        "content":"test",
        "language":"en"
      }
    },
    "type":"hotels"
  }
}
```

Curl call to create resource:
```bash
curl -X POST http://localhost:500/hotels --data '{ "data":{ "attributes":{ "name":[{ "content":"Ritz", "language":"en" }], "description":[{ "content":"Lorem ipsum dolor sit amet.", "language":"en" }], "test":{ "content":"test", "language":"en" }}, "type":"hotels" }}' -H "Content-Type: application/vnd.api+json"
```

Logs:
``` bash
==Executing query==
PREFIX ext: <http://mu.semte.ch/vocabularies/ext/>
PREFIX pdt: <http://xdc.tenforce.com/taxonomy/personal-data/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX dcat: <http://www.w3.org/ns/dcat#>
PREFIX tf: <http://xdc.tenforce.com/elements/>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX rm: <http://mu.semte.ch/vocabularies/logical-delete/>
PREFIX typedLiterals: <http://mu.semte.ch/vocabularies/typed-literals/>
PREFIX mu: <http://mu.semte.ch/vocabularies/core/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX app: <http://mu.semte.ch/app/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
INSERT DATA
{
GRAPH <http://mu.semte.ch/application> {
<http:/test-url.be/hotels/5CA3335F8F61C30008000001> a ext:Hotel.
<http:/test-url.be/hotels/5CA3335F8F61C30008000001> mu:uuid """5CA3335F8F61C30008000001""".
<http:/test-url.be/hotels/5CA3335F8F61C30008000001> dct:title """Ritz"""@en.
<http:/test-url.be/hotels/5CA3335F8F61C30008000001> dct:description """Lorem ipsum dolor sit amet."""@en.
<http:/test-url.be/hotels/5CA3335F8F61C30008000001> dct:test """test"""@en.
}
}
```


### Update resource
```json
{
  "data":{
    "id":"5CA3335F8F61C30008000001",
    "attributes":{
      "name":[
        {
          "content":"Ritz 2",
          "language":"en"
        }
      ],
      "description":[
        {
          "content":"Lorem ipsum dolor sit amet. 2",
          "language":"en"
        }
      ],
      "test":{
        "content":"test 2",
        "language":"en"
      }
    },
    "type":"hotels"
  }
}
```

Curl call
```bash
curl -X PATCH http://localhost:500/hotels/5CA343D37A818B0008000001 --data '{ "data":{ "id": "5CA343D37A818B0008000001", "attributes":{ "name":[{ "content":"Ritz 2", "language":"en" }], "description":[{ "content":"Lorem ipsum dolor sit amet. 2", "language":"en" }], "test":{ "content":"test 2", "language":"en" }}, "type":"hotels" }}' -H "Content-Type: application/vnd.api+json"
```

Logs:
```bash
==Executing query==
PREFIX ext: <http://mu.semte.ch/vocabularies/ext/>
PREFIX pdt: <http://xdc.tenforce.com/taxonomy/personal-data/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX dcat: <http://www.w3.org/ns/dcat#>
PREFIX tf: <http://xdc.tenforce.com/elements/>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX rm: <http://mu.semte.ch/vocabularies/logical-delete/>
PREFIX typedLiterals: <http://mu.semte.ch/vocabularies/typed-literals/>
PREFIX mu: <http://mu.semte.ch/vocabularies/core/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX app: <http://mu.semte.ch/app/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
DELETE {
    GRAPH <http://mu.semte.ch/application> {
        <http:/test-url.be/hotels/5CA3335F8F61C30008000001> dct:title ?gensym0.
    <http:/test-url.be/hotels/5CA3335F8F61C30008000001> dct:description ?gensym1.
    <http:/test-url.be/hotels/5CA3335F8F61C30008000001> dct:test ?gensym2.
}
} WHERE {
    GRAPH <http://mu.semte.ch/application> {
        OPTIONAL {     <http:/test-url.be/hotels/5CA3335F8F61C30008000001> dct:title ?gensym0.
 }
    OPTIONAL {     <http:/test-url.be/hotels/5CA3335F8F61C30008000001> dct:description ?gensym1.
 }
    OPTIONAL {     <http:/test-url.be/hotels/5CA3335F8F61C30008000001> dct:test ?gensym2.
 }
}
};
INSERT DATA
{
    GRAPH <http://mu.semte.ch/application> {
        <http:/test-url.be/hotels/5CA3335F8F61C30008000001> dct:title """Ritz 2"""@en.
    <http:/test-url.be/hotels/5CA3335F8F61C30008000001> dct:description """Lorem ipsum dolor sit amet. 2"""@en.
    <http:/test-url.be/hotels/5CA3335F8F61C30008000001> dct:test """test 2"""@en.
}
}
```
