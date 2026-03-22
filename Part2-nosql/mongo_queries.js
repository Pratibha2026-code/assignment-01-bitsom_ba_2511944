// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    _id: "E1001",
    name: "Samsung 55 inch Smart TV",
    category: "Electronics",
    brand: "Samsung",
    price: 52000,
    specifications: {
      screen_size: "55 inch",
      resolution: "4K",
      voltage: "220V",
      warranty: "2 years"
    },
    features: ["Smart TV", "HDR", "WiFi Enabled"],
    stock: 25
  },
  {
    _id: "C2001",
    name: "Men Cotton T-Shirt",
    category: "Clothing",
    brand: "Levis",
    price: 999,
    sizes_available: ["S", "M", "L", "XL"],
    colors: ["Black", "White", "Blue"],
    material: "100% Cotton",
    care_instructions: {
      wash: "Machine Wash",
      dry: "Tumble Dry Low"
    },
    stock: 100
  },
  {
    _id: "G3001",
    name: "Organic Almonds",
    category: "Groceries",
    brand: "NutriFarm",
    price: 450,
    weight: "500g",
    expiry_date: new Date("2024-12-30"),
    nutritional_info: {
      calories: "579 kcal",
      protein: "21g",
      fat: "50g"
    },
    ingredients: ["100% Organic Almonds"],
    stock: 60
  }
]);


// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});


// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { _id: "E1001" },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });

// This index improves query performance when searching products by category,
// such as retrieving all Electronics or Groceries items.
