# Open API Temperature Converter

A simple API for converting temperatures between Celsius and Fahrenheit, with validation to ensure inputs do not go below absolute zero.

---

## **Features**
- Convert temperatures from Celsius to Fahrenheit and vice versa.
- Input validation to prevent values below absolute zero.
- Detailed error handling with appropriate HTTP status codes.
- Automatically generated API documentation using Swagger (via `rswag`).

---

## **Endpoints**

### **Convert Temperature**
**Endpoint:** `GET /convert`
Converts a given temperature from one scale to the other.

#### **Query Parameters**
| Name   | Type   | Required | Description                                                                 |
|--------|--------|----------|-----------------------------------------------------------------------------|
| `value`| Number | Yes      | The temperature value to be converted.                                      |
| `scale`| String | Yes      | The current scale of the temperature (`C` for Celsius, `F` for Fahrenheit). |

#### **Responses**
| Status | Description                                      | Example Response                                                                                   |
|--------|--------------------------------------------------|----------------------------------------------------------------------------------------------------|
| `200`  | Temperature converted successfully.             | `{ "input": 100, "scale": "C", "converted_value": 212.0, "converted_scale": "F" }`                |
| `400`  | Invalid scale provided.                         | `{ "error": "Invalid scale. Use 'C' for Celsius or 'F' for Fahrenheit." }`                        |
| `422`  | Temperature is below absolute zero.             | `{ "error": "Temperature cannot be below absolute zero: -273.15°C or -459.67°F." }`               |

---

## **Installation**

### **Requirements**
- Ruby `3.2.2`
- Rails `7.0+`
- Bundler

### **Setup**
1. Clone the repository:
   ```bash
   git clone https://github.com/teslazonda/open_temperature_converter
   cd open_temperature_converter
   ```

2. Install dependencies:
    ```bash
    bundle install
    ```

3. Start the server:
    ```bash
    rails server
    ```

## **Testing**

## **Run RSpec Tests**
To ensure everything works as expected:

    ```bash
    bundle exec rspec
    ```

## **Generate Open API Documentation**

    ```bash
    bundle exec rake rswag:specs:swaggerize
    ```

Swagger files will be generated in the swagger/v1/ directory.

## **Usage**

### **Using Curl**

#### Example 1: Convert `100°C` to Fahrenheit
**Request**:
```bash
curl -X GET "http://localhost:3000/convert?value=100&scale=C"
```

**Response**

```json
{
  "input": 100,
  "scale": "C",
  "converted_value": 212.0,
  "converted_scale": "F"
}
```

#### Example 2: Request with invalid input below absolute zero:

```bash
curl -X GET "http://localhost:3000/convert?value=-300&scale=C"
```

**Response**

```json
{
  "error": "Temperature cannot be below absolute zero: -273.15°C or -459.67°F."
}
```
## **Swagger API Documentation**
Swagger documentation is available at:

```bash
http://localhost:3000/api-docs
```
Use this interface to interact with the API and view detailed specifications.
