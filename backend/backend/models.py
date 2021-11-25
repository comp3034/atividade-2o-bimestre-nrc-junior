from sqlalchemy import BigInteger, Boolean, Column, DateTime, ForeignKey, \
    Integer, String
from sqlalchemy.orm import relationship

from .database import Base


class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    email = Column(String, unique=True)
    name = Column(String)
    hashed_password = Column(String, nullable=True)
    is_active = Column(Boolean, default=True)
    birth_date = Column(DateTime, nullable=True)

    measures = relationship("Measure", back_populates="user")


class Measure(Base):
    __tablename__ = "measures"

    id = Column(Integer, primary_key=True, index=True)
    height = Column(Integer, default=0)
    weight = Column(Integer, default=0)
    neck = Column(Integer, default=0)
    chest = Column(Integer, default=0)
    biceps = Column(Integer, default=0)
    hips = Column(Integer, default=0)
    waist = Column(Integer, default=0)
    thighs = Column(Integer, default=0)
    calf = Column(Integer, default=0)
    user_id = Column(Integer, ForeignKey("users.id"))

    user = relationship("User", back_populates="measures")
