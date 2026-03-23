// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    _id: "P001",
    product_name: "Laptop",
    category: "Electronics",
    brand: "Dell",
    price: 55000,
    specifications: {
      processor: "Intel i5",
      ram: "16GB",
      storage: "512GB SSD",
      screen_size: "15.6 inch"
    },
    warranty: {
      period_years: 2,
      type: "On-site"
    },
    ratings: [4, 5, 5, 3, 4],
    available: true
  },
  {
    _id: "P003",
    product_name: "Desk Chair",
    category: "Furniture",
    brand: "Ikea",
    price: 8500,
    dimensions: {
      height: "120 cm",
      width: "60 cm",
      depth: "60 cm"
    },
    material: ["Mesh", "Metal"],
    features: [
      "Adjustable height",
      "Lumbar support",
      "Swivel base"
    ],
    in_stock: true
  },
  {
    _id: "P004",
    product_name: "Notebook",
    category: "Stationery",
    brand: "Classmate",
    price: 120,
    details: {
      pages: 200,
      size: "A4",
      binding: "Spiral"
    },
    pack_options: [
      { pack_size: 1, price: 120 },
      { pack_size: 5, price: 550 }
    ],
    eco_friendly: true,
    colors_available: ["Blue", "Black", "Red"]
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
  { _id: "P001" },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });

// Explanation:
// Creating an index on the "category" field improves query performance,
// especially for frequent searches like filtering products by category
// (e.g., Electronics, Furniture). It reduces the need for full collection scans.
