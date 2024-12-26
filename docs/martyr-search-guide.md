# Martyr Search API Guide

## Overview
This guide explains how to search for martyrs using the API's various filter options.

## Base Endpoint
```
POST /api/v1/martyrs/search
```

## 1. Search by Name
Search martyrs by their name, full name, or code name.

```json
{
  "name": "Nguyễn",
  "filters": [],
  "page": 0,
  "size": 10
}
```

Alternative method using LIKE filter:
```json
{
  "filters": [
    {
      "key": "fullName",
      "operator": "LIKE",
      "fieldType": "STRING",
      "value": "Nguyễn"
    }
  ],
  "page": 0,
  "size": 10
}
```

## 2. Filter Options

### 2.1 Filter by Year of Birth and Death
Search martyrs by their birth year and/or death year.

```json
{
  "filters": [
    {
      "key": "yearOfBirth",
      "operator": "EQUAL",
      "fieldType": "STRING",
      "value": "1930"
    },
    {
      "key": "dateOfDeath",
      "operator": "EQUAL",
      "fieldType": "STRING",
      "value": "1975"
    }
  ],
  "page": 0,
  "size": 10,
  "searchType": "search_or"
}
```

### 2.2 Filter by Grave Area and Row
Search martyrs by their burial location using area and row information.

```json
{
  "filters": [
    {
      "key": "graveRow.areaName",
      "operator": "EQUAL",
      "fieldType": "STRING",
      "value": "A 1"
    },
    {
      "key": "graveRow.rowName",
      "operator": "EQUAL",
      "fieldType": "STRING",
      "value": "VH- Số4"
    }
  ],
  "page": 0,
  "size": 10
}
```

### 2.3 Combined Search
Combine multiple filters to perform a more specific search. You can use different combinations of search criteria and operators.

#### Example 1: Search by Name and Location
```json
{
  "name": "Nguyễn",
  "filters": [
    {
      "key": "graveRow.areaName",
      "operator": "EQUAL",
      "fieldType": "STRING",
      "value": "A 1"
    },
    {
      "key": "graveRow.rowName",
      "operator": "EQUAL",
      "fieldType": "STRING",
      "value": "VH- Số4"
    }
  ],
  "page": 0,
  "size": 10
}
```

#### Example 2: Search with OR Condition
```json
{
  "filters": [
    {
      "key": "yearOfBirth",
      "operator": "EQUAL",
      "fieldType": "STRING",
      "value": "1930"
    },
    {
      "key": "dateOfDeath",
      "operator": "EQUAL",
      "fieldType": "STRING",
      "value": "1975"
    }
  ],
  "searchType": "search_or",
  "page": 0,
  "size": 10
}
```

#### Example 3: Complex Search with Multiple Criteria
```json
{
  "name": "Nguyễn",
  "filters": [
    {
      "key": "graveRow.areaName",
      "operator": "EQUAL",
      "fieldType": "STRING",
      "value": "A 1"
    },
    {
      "key": "yearOfBirth",
      "operator": "EQUAL",
      "fieldType": "STRING",
      "value": "1930"
    }
  ],
  "sorts": [
    {
      "key": "fullName",
      "direction": "ASC"
    }
  ],
  "page": 0,
  "size": 10
}
```

#### Example 4: Search with Multiple OR Conditions
```json
{
  "filters": [
    {
      "key": "fullName",
      "operator": "LIKE_OR",
      "fieldType": "STRING",
      "values": ["Nguyễn", "Tran Van"]
    },
    {
      "key": "homeTown",
      "operator": "IN",
      "fieldType": "STRING",
      "values": ["Dong Thap", "An Giang"]
    }
  ],
  "searchType": "search_or",
  "page": 0,
  "size": 10
}
```

#### Example 5: Complete Search with All Options
```json
{
  "name": "Nguyễn",
  "filters": [
    {
      "key": "graveRow.areaName",
      "operator": "EQUAL",
      "fieldType": "STRING",
      "value": "A 1"
    },
    {
      "key": "graveRow.rowName",
      "operator": "EQUAL",
      "fieldType": "STRING",
      "value": "VH- Số4"
    },
    {
      "key": "yearOfBirth",
      "operator": "EQUAL",
      "fieldType": "STRING",
      "value": "1930"
    },
    {
      "key": "dateOfDeath",
      "operator": "EQUAL",
      "fieldType": "STRING",
      "value": "1975"
    }
  ],
  "sorts": [
    {
      "key": "fullName",
      "direction": "ASC"
    },
    {
      "key": "yearOfBirth",
      "direction": "DESC"
    }
  ],
  "searchType": "search_or",
  "page": 0,
  "size": 10
}
```

## Available Operators
- `EQUAL`: Exact match
- `LIKE`: Partial match (case-insensitive)
- `IN`: Match any value in list
- `NOT_EQUAL`: Not equal to value
- `BETWEEN`: Range search (for dates and numbers)

## Field Types
- `STRING`: For text values
- `INTEGER`: For whole numbers
- `DATE`: For date values

## Response Format
```json
{
  "content": [
    {
      "id": "uuid-string",
      "areaName": "A 1",
      "rowName": "Hàng 6",
      "fullName": "Nguyễn Văn Đạt",
      "name": "Đạt",
      "codeName": "Sáu Bảo",
      "yearOfBirth": "1930",
      "dateOfEnlistment": "8/1961",
      "dateOfDeath": "9/6/73",
      "rankPositionUnit": "Thượng sĩ, quân y tỉnh đội Đồng Tháp",
      "homeTown": "Xã Nhị Mỹ, huyện Cao Lãnh, ĐT",
      "placeOfExhumation": "Nhị Mỹ CL 1982",
      "note": "",
      "commune": "Xã Nhị Mỹ",
      "district": "H- Cao Lãnh - ĐT"
    }
  ],
  "totalElements": 1,
  "totalPages": 1,
  "size": 10,
  "number": 0
}
```

## Sorting Results
Add sorting criteria to your search:

```json
{
  "filters": [...],
  "sorts": [
    {
      "key": "fullName",
      "direction": "ASC"
    }
  ],
  "page": 0,
  "size": 10
}
```

Sort directions:
- `ASC`: Ascending order
- `DESC`: Descending order

## Common Search Fields
- `fullName`: Full name of the martyr
- `yearOfBirth`: Year of birth
- `dateOfDeath`: Date of death
- `graveRow.areaName`: Cemetery area name
- `graveRow.rowName`: Row number/name in the area
- `homeTown`: Place of origin
- `rankPositionUnit`: Military rank and unit
