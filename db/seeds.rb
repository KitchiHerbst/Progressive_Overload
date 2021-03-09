Lifter.destroy_all
Gym.destroy_all
Workout.destroy_all

jose = Lifter.create(name: "Jose", height:65, weight: 190, age: 26, gender: "male")
triston = Lifter.create(name: "Triston", height: 71, weight: 227, age: 23, gender: "male")

laf = Gym.create(name:"LAFitness", location: "123 Whitestone")
pf = Gym.create(name:"Planet Fitness", location: "456 New York")

w1 = Workout.create(lifter_id: jose.id, gym_id: pf.id)
w2 = Workout.create(lifter_id: triston.id, gym_id: laf.id)
w3 = Workout.create(lifter_id: jose.id , gym_id: laf.id)






