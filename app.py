from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"message": "para sumar los numeros ingrese en el explorador /sumar/{num1}/{num2}"}

@app.get("/sumar/{num1}/{num2}")
def sumar(num1: int, num2: int):
    resultado = num1 + num2
    return{"resultado" : resultado}

    