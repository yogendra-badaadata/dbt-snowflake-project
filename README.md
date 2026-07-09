# Minimal Snowflake dbt Project

This is a minimal, production-style dbt project configured to connect to Snowflake using environment variables. It defines two basic models: `users` and `orders`.

## Project Structure

```text
.
├── dbt_project.yml   # Main dbt project configuration
├── profiles.yml      # Connection profile using environment variables
├── models/
│   ├── sources/
│   │   └── sources.yml # Declares Snowflake raw tables as dbt sources
│   ├── users.sql       # Filters raw users source to valid emails
│   └── orders.sql      # Joins raw orders source with the users model
└── README.md           # Setup and run instructions
```

---

## Getting Started

### 1. Install dbt-snowflake
It is recommended to use a virtual environment. Install `dbt-snowflake` via pip:

```bash
pip install dbt-snowflake
```

### 2. Set Up Environment Variables
dbt uses credentials stored in environment variables to dynamically resolve connection properties defined in `profiles.yml`. 

Set the following variables:

#### PowerShell (Windows)
```powershell
$env:DBT_SNOWFLAKE_ACCOUNT="nvkrhqt-pv88516"
$env:DBT_SNOWFLAKE_WAREHOUSE="COMPUTE_WH"
$env:DBT_SNOWFLAKE_DATABASE="DBT_SEMANTIC_TEST"
$env:DBT_SNOWFLAKE_ROLE="ACCOUNTADMIN"
$env:DBT_SNOWFLAKE_SCHEMA="PUBLIC"
$env:DBT_SNOWFLAKE_USER="YOGENDRAFEGADE"
$env:DBT_SNOWFLAKE_PASSWORD="Yogendra@957980"
```

#### Command Prompt (Windows CMD)
```cmd
set DBT_SNOWFLAKE_ACCOUNT=nvkrhqt-pv88516
set DBT_SNOWFLAKE_WAREHOUSE=COMPUTE_WH
set DBT_SNOWFLAKE_DATABASE=DBT_SEMANTIC_TEST
set DBT_SNOWFLAKE_ROLE=ACCOUNTADMIN
set DBT_SNOWFLAKE_SCHEMA=PUBLIC
set DBT_SNOWFLAKE_USER=YOGENDRAFEGADE
set DBT_SNOWFLAKE_PASSWORD=Yogendra@957980
```

#### Bash (Linux/macOS/Git Bash)
```bash
export DBT_SNOWFLAKE_ACCOUNT="nvkrhqt-pv88516"
export DBT_SNOWFLAKE_WAREHOUSE="COMPUTE_WH"
export DBT_SNOWFLAKE_DATABASE="DBT_SEMANTIC_TEST"
export DBT_SNOWFLAKE_ROLE="ACCOUNTADMIN"
export DBT_SNOWFLAKE_SCHEMA="PUBLIC"
export DBT_SNOWFLAKE_USER="YOGENDRAFEGADE"
export DBT_SNOWFLAKE_PASSWORD="Yogendra@957980"
```

### 3. Initialize Snowflake Raw Tables (Prerequisite)
Ensure that the source tables exist in your Snowflake schema (`DBT_SEMANTIC_TEST.PUBLIC`) before running the dbt models. You can execute this SQL script in your Snowflake worksheet to create and populate the source tables:

```sql
-- Switch to database and schema
USE DATABASE DBT_SEMANTIC_TEST;
USE SCHEMA PUBLIC;

-- Create raw_users table
CREATE OR REPLACE TABLE raw_users (
    id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    created_at TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

-- Insert dummy users
INSERT INTO raw_users (id, first_name, last_name, email) VALUES
(1, 'Alice', 'Smith', 'alice@example.com'),
(2, 'Bob', 'Jones', 'bob@example.com');

-- Create raw_orders table
CREATE OR REPLACE TABLE raw_orders (
    id INT,
    user_id INT,
    order_date DATE,
    status VARCHAR(20),
    amount DECIMAL(10, 2)
);

-- Insert dummy orders
INSERT INTO raw_orders (id, user_id, order_date, status, amount) VALUES
(101, 1, '2026-07-01', 'completed', 99.99),
(102, 2, '2026-07-02', 'pending', 49.50);
```

### 4. Run `dbt debug` to Test Connection
Run `dbt debug` specifying the current folder (`.`) as the profiles directory. This validates connection credentials and verifies Snowflake connectivity.

```bash
dbt debug --profiles-dir .
```

### 5. Run `dbt run` to Build Models
Run `dbt run` to compile your SQL models and create them in Snowflake:

```bash
dbt run --profiles-dir .
```

This will compile the SQL queries and build two tables in Snowflake:
- `DBT_SEMANTIC_TEST.PUBLIC.USERS` (Filtered list of valid users)
- `DBT_SEMANTIC_TEST.PUBLIC.ORDERS` (Completed orders joined with user attributes via the `ref()` function)
