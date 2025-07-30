from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from typing import List
from ..core.database import get_db
from ..schemas.slider_image import SliderImageOut
from ..crud.slider_image import get_slider_images
from ..models.slider_image import SliderImage

router = APIRouter(prefix="/slider", tags=["slider"])

@router.get("/images", response_model=List[SliderImageOut])
def get_slider_images_public_endpoint(db: Session = Depends(get_db)):
    """
    Endpoint عام لجلب صور السلايدر (بدون تحقق أدمن)
    """
    sliders = get_slider_images(db)
    return [SliderImageOut.parse_obj(s) for s in sliders]

@router.get("/admin/slider-images", response_model=List[SliderImageOut])
def get_slider_images_admin_endpoint(db: Session = Depends(get_db)):
    """
    Endpoint لإدارة السلايدر (admin) لجلب صور السلايدر
    """
    sliders = get_slider_images(db)
    return [SliderImageOut.parse_obj(s) for s in sliders] 