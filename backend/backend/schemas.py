from typing import List, Optional
from pydantic import BaseModel
from datetime import datetime

class MeasureBase(BaseModel):
    height: Optional[int]
    weight: Optional[int]
    neck: Optional[int]
    chest: Optional[int]
    biceps: Optional[int]
    hips: Optional[int]
    waist: Optional[int]
    thighs: Optional[int]
    calf: Optional[int]
    

class MeasureCreate(MeasureBase):
    pass


class Measure(MeasureBase):
    id: int
    user_id: int

    class Config:
        orm_mode = True


class UserBase(BaseModel):
    name: str
    email: str


class UserCreate(UserBase):
    password: str


class User(UserBase):
    id: int
    is_active: bool
    birth_date: Optional[datetime]    

    class Config:
        orm_mode = True
