# README

## Examples

### Retrieve all Products (GET)

```bash
curl http://127.0.0.1:3000/api/products
```

```json
[
  {
    "id": "581f75fa79b46b17396f99c5",
    "name": "Ardbeg Uigeadail",
    "description": "Uigeadail derives from the Scotch Gaelic for 'Dark and Mysterious Place' and is named for the Loch from whence Ardbeg draws its waters. Jim Murray's 2009 World Whisky of the Year, this cask-strength bottle exudes breathtaking balance.",
    "price": 5295,
    "display_price": "£52.95"
  }
]
```

### Create a Shopper (POST)

```bash
curl -d "name=cameron&email=test@example.org" http://127.0.0.1:3000/api/shoppers
```

```json
{
  "id": "581f793779b46b1823995016",
  "name": "Test User",
  "email": "test@example.org",
  "basket": {
    "id": "581f793779b46b1823995017",
    "items": []
  }
}
```

### Update a Shopper (PUT)

```bash
curl -X PUT -d "name=Mr Test User" http://127.0.0.1:3000/api/shoppers/581f793779b46b1823995016
```

```json
{
  "id": "581f793779b46b1823995016",
  "name": "Mr Test User",
  "email": "test@example.org",
  "basket": {
    "id": "581f793779b46b1823995017",
    "items": []
  }
}
```

### Get Basket contents (GET)

```bash
curl http://127.0.0.1:3000/api/shoppers/581f793779b46b1823995016/basket
```

```json
{
  "id": "581f793779b46b1823995017",
  "items": []
}
```

### Update Basket (PUT)

```bash
curl -X PUT -d "product_ids[]=581f75fa79b46b17396f99c5" \
  http://127.0.0.1:3000/api/shoppers/581f793779b46b1823995016/basket
```

```json
{
  "id": "581f793779b46b1823995017",
  "items": [
    {
      "_id": "581f7a1d79b46b1823995018",
      "product_id": "581f75fa79b46b17396f99c5"
    }
  ]
}
```

### Empty Basket (DELETE)

```bash
curl -X DELETE http://127.0.0.1:3000/api/shoppers/581f793779b46b1823995016/basket
```

```json

```

### Checkout (POST)

```bash
curl -d "" http://127.0.0.1:3000/api/shoppers/581f793779b46b1823995016/checkout
```

```json
{
  "id": "581f7a8a79b46b182399501a",
  "total": 5295,
  "line_items": [
    {
      "id": "581f7a8a79b46b182399501b",
      "quantity": 1
    }
  ]
}
```
