Lifter.destroy_all
Gym.destroy_all
Lift.destroy_all
Workout.destroy_all
WorkoutType.destroy_all

jose = Lifter.create(name: "Jose", height:65, weight: 190, age: 26, gender: "male")
triston = Lifter.create(name: "Triston", height: 71, weight: 227, age: 23, gender: "male")

laf = Gym.create(name:"LAFitness", location: "123 Whitestone")
pf = Gym.create(name:"Planet Fitness", location: "456 New York")

w1 = Workout.create(lifter_id: jose.id, gym_id: pf.id)
w2 = Workout.create(lifter_id: triston.id, gym_id: laf.id)
w3 = Workout.create(lifter_id: jose.id , gym_id: laf.id) 


# jose_bench = Weight.create(name:"Bench", workout_id: w1.id, first_reps:12, first_weight:145, second_reps:12, second_weight:145,third_reps:10 ,third_weight:155)
# triston_squat = Weight.create(name:"Squat", workout_id: w2.id, first_reps:10, first_weight:185, second_reps:10, second_weight:185, third_reps:8, third_weight:195)
# jose_curl = Weight.create(name:"Arm Curls", workout_id:w3.id, first_reps:13, first_weight:20, second_reps:12, second_weight:20, third_reps:10, third_weight:25)



