import pandas as pd
import numpy as np

# -----------------------------
# Configuration
# -----------------------------
np.random.seed(42)

restaurants = [
    {"restaurant_id": 1, "restaurant_name": "Vikingos Grill Norte", "city": "Monterrey"},
    {"restaurant_id": 2, "restaurant_name": "Vikingos Grill Sur", "city": "Monterrey"},
    {"restaurant_id": 3, "restaurant_name": "Vikingos Grill Centro", "city": "Guadalajara"},
    {"restaurant_id": 4, "restaurant_name": "Vikingos Grill Playa", "city": "Cancún"},
]

date_range = pd.date_range(start="2024-01-01", end="2024-12-31", freq="D")

# -----------------------------
# Helper functions
# -----------------------------
def generate_daily_sales():
    """Simulate total daily sales."""
    return np.round(np.random.normal(loc=18000, scale=4500), 2)

def generate_customers():
    """Simulate number of daily customers."""
    return int(np.random.normal(loc=220, scale=50))

def pct_distribution():
    """Generate random percentage mix that sums to 1."""
    vals = np.random.dirichlet(np.ones(3), size=1)[0]
    return vals

# -----------------------------
# Build dataset
# -----------------------------
rows = []

for rest in restaurants:
    for day in date_range:
        total_sales = generate_daily_sales()
        customers = generate_customers()
        avg_ticket = np.round(total_sales / customers, 2)

        food_pct, drinks_pct, dessert_pct = pct_distribution()
        card_pct, cash_pct, online_pct = pct_distribution()

        rows.append({
            "date": day,
            "restaurant_id": rest["restaurant_id"],
            "restaurant_name": rest["restaurant_name"],
            "city": rest["city"],

            # Sales metrics
            "total_sales_mxn": total_sales,
            "customers": customers,
            "avg_ticket_mxn": avg_ticket,

            # Sales composition (by revenue)
            "pct_food_sales": food_pct,
            "pct_drink_sales": drinks_pct,
            "pct_dessert_sales": dessert_pct,

            # Payment method distribution
            "pct_card_payments": card_pct,
            "pct_cash_payments": cash_pct,
            "pct_online_payments": online_pct,

            # Contextual variables
            "is_weekend": day.weekday() >= 5,
            "day_of_week": day.day_name(),
            "holiday_flag": day in [
                pd.Timestamp("2024-01-01"),
                pd.Timestamp("2024-05-01"),
                pd.Timestamp("2024-09-16"),
                pd.Timestamp("2024-12-25")
            ]
        })

# Convert to DataFrame
df = pd.DataFrame(rows)

print(df.head())
df.shape
df.to_csv("dummy_sales_vikingosgrill.csv", index=False, encoding="utf-8")