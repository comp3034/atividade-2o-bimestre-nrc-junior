import datetime
from typing import List

from fastapi import Depends, FastAPI, HTTPException
from sqlalchemy.orm import Session


from . import crud, models, schemas
from .database import SessionLocal, engine

models.Base.metadata.create_all(bind=engine)
    
app = FastAPI()
    
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.post("/users/", response_model=schemas.User)
def create_user(user: schemas.UserCreate, db: Session = Depends(get_db)):
    db_user = crud.get_user_by_email(db, email=user.email)
    if db_user:
        raise HTTPException(status_code=400, detail="E-mail já cadastrado")

    user = crud.create_user(db=db, user=user)
    
    return user

@app.get("/users/", response_model=List[schemas.User])
def read_users(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    users = crud.get_users(db, skip=skip, limit=limit)
    return users

@app.get("/users/{user_id}", response_model=schemas.User)
def read_user(user_id: int, db: Session = Depends(get_db)):
    user = crud.get_user(db, user_id=user_id)
    
    if user == None:
        raise HTTPException(status_code=400, detail="Usúario não existe")
    return user

# PUT/PATCH de usuário (alteração dos campos nome, email e data de nascimento) (/users/<int:id>/)
@app.put("/users/{user_id}", response_model=schemas.User)
def change_user(user_id: int, user: schemas.UpdateUser,  db: Session = Depends(get_db)):
    crud.update_user(db, user=user, user_id=user_id)
    return crud.get_user(db, user_id)

# POST de medidas (/users/<int:id>/measures/)
@app.post("/users/{user_id}/measures/", response_model=schemas.Measure)
def create_measure(user_id: int, measure: schemas.MeasureCreate, db: Session = Depends(get_db)):
    db_measure = crud.get_measures_by_id(db, user_id=user_id)
    if db_measure:
       crud.update_measure(db, measure=measure, user_id=user_id)
       # não faço ideia como faz pro update retornar os valores (???)    
       db_measure = crud.get_measures_by_id(db, user_id=user_id)
    else:
       db_measure = crud.create_user_measure(db, measure=measure, user_id=user_id)

    return db_measure

# GET de todas as medidas de um determinado usuário (/users/<int:id>/measures/)
@app.get("/users/{user_id}/measures/", response_model=schemas.Measure)
def read_user_measures(user_id: int, db: Session = Depends(get_db)):
    return crud.get_measures_by_id(db, user_id=user_id)

# GET de todas as medidas (/measures/)
@app.get("/measures/", response_model=List[schemas.Measure])
def read_user_measures(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    return crud.get_measures(db, skip=skip, limit=limit)

