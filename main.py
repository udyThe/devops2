from fastapi import FastAPI

app = FastAPI()
a
@app.get("/")
def read_root():
    return {"message": "Hello, FastAPI with Docker and CI/CD!"}