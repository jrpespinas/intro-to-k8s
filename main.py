from redis import Redis
from fastapi import FastAPI

app = FastAPI()
redis_client = Redis(host='redis-service', port=6379)


@app.get("/")
async def index():
    redis_client.incr('visitor')
    return {"message": f"Hello, visitor #{redis_client.get('visitor')}!"}
