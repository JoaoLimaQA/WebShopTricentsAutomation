from faker  import  Faker
from robot.api.types import Secret  

fake = Faker('pt_BR')


def get_fake_data():
    data = {
        "first_name" : fake.name_female() , 
        "last_name" : fake.last_name_female(),
        "email" : fake.email(),     
        "senha": "pwd123"
    }
    return  data