# Pizza Sales Analysis Dashboard (Excel)

An interactive Excel dashboard that analyzes pizza sales to answer common restaurant questions.

<img width="930" height="517" alt="Screenshot 2026-11-17 182108" src="https://github.com/user-attachments/assets/446d1fae-2585-475d-b4e6-b7907129fe5f" />


## What it covers
- KPIs: total revenue, average order value, total pizzas sold, total orders, average pizzas per order
- Order trends by day of week and by hour
- Sales share by pizza category and size
- Top 5 and bottom 5 selling pizzas
- Timeline slicer that filters the whole dashboard by period

## Key findings

- **Overall:** 21,350 orders and 49,574 pizzas sold generated $817,860 in revenue. The average order value was $38.31, with 2.32 pizzas per order.
- **Busiest days:** Friday had the most orders (3,538), followed by Thursday (3,239) and Saturday (3,158). Sunday was the quietest day (2,624).
- **Busiest hours:** Orders peak at lunchtime (12-1 pm) and again in the early evening (around 5-6 pm), and drop off sharply after 9 pm.
- **Category mix:** Classic is the top category by sales share (26.91%) and by pizzas sold (14,888). The four categories are close in sales share (about 24-27% each).
- **Size mix:** Large pizzas account for 45.89% of sales, followed by Medium (30.49%) and Regular (21.77%). X-Large and XX-Large together are under 2%.
- **Best sellers (by quantity):** The Classic Deluxe (2,453), Barbecue Chicken (2,432) and Hawaiian (2,422) lead, and the top five are very close together.
- **Worst sellers (by quantity):** The Brie Carre is the lowest at 490 pizzas, about half of the next lowest sellers (934-961).

## Tools
- Microsoft SQL Server Management Studio (SSMS): stored and queried the data, then imported it into Excel
- Microsoft Excel: data transformation, pivot tables, charts, slicers and the final dashboard

## How I built it

1. **Queried the data in SQL Server (SSMS):** Queried the data in SQL Server (SSMS) to calculate KPIs, daily and hourly order trends, sales share by category and size, and the top and bottom 5 sellers.
2. **Imported into Excel:** Imported the data from SQL Server into Excel for analysis and visualization.
3. **Counted orders correctly:** Each order appears on several rows (one per pizza line), so counting rows would overstate the number of orders. In Excel I gave each row a weight of 1 divided by the number of rows in that order (for example, an order that appears 5 times gets 0.2 per row), so every order adds up to exactly 1. Summing the weights gives the true total orders.
4. **Created the order day:** Converted the order date into the day of the week in Excel to analyze the weekly trend of orders by day.
5. **Built pivot tables and charts:** Created pivot tables for the KPIs, orders by day and hour, sales by category and size, and the top and bottom 5 sellers, and turned them into charts.
6. **Added a timeline slicer and designed the dashboard:** Connected the slicer to all pivot tables so the whole dashboard updates by period, then arranged everything on one sheet.
