<!-- Tables -->
Lifters {
    ID PIK
    name string
    height(inches) integer
    weight float
    age integer
    gender string
}
<!--  -->
Gyms {
    ID PIK
    name string
    location string
}
<!--  -->
workouts {
    ID PIK
    FK - lifter_id
    FK - gym_id
    Start time timestamp
    End time timestamp
    weights boolean
    cardio boolean
} 
<!--  -->

Cardio{
    ID PIK
    name 
    FKw
    FKl
    distance float
    time float
}

weights {
    ID PIK
    FKw
    FKl
    name
    1st_reps integer
    1st_weight integer
    2nd_reps integer
    2nd_weight integer
    3rd_reps integer
    3rd_weight integer
}
