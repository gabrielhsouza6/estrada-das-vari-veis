extends Node

var characters = [
	{
		"name": "Noble Man",
		"tag": "MiniNobleMan",
		"price": 20000,
	},
	{
		"name": "Noble Woman",
		"tag": "MiniNobleWoman",
		"price": 15000
	},
	{
		"name": "Old Man",
		"tag": "MiniOldMan",
		"price": 10000
	},
	{
		"name": "Old Woman",
		"tag": "MiniOldWoman",
		"price": 10000
	},
	{
		"name": "Peasent",
		"tag": "MiniPeasant",
		"price": 5000
	},
	{
		"name": "Princess",
		"tag": "MiniPrincess",
		"price": 20000
	},
	{
		"name": "Queen",
		"tag": "MiniQueen",
		"price": 40000
	},
	{
		"name": "Villager Man",
		"tag": "MiniVillagerMan",
		"price": 5000
	},
	{
		"name": "Villager Woman",
		"tag": "MiniVillagerWoman",
		"price": 5000
	},
	{
		"name": "Worker",
		"tag": "MiniWorker",
		"price": 1000
	}
]

var powers = [
	{
		"name": "Sprint Boots",
		"price": 15000,
		"description": "It speeds you up!",
		"texture": AtlasTexture,
		"x": 0,
		"y": 16,
		"attribute": "speed",
		"value": 1.25
	},
	{
		"name": "Strong Heart",
		"price": 10000,
		"description": "It increases your health!",
		"texture": AtlasTexture,
		"x": 5,
		"y": 1,
		"attribute": "health",
		"value": 1.25
	},
	{
		"name": "Wood Shield",
		"price": 15000,
		"description": "It increases your defenses!",
		"texture": AtlasTexture,
		"x": 2,
		"y": 17,
		"attribute": "defense",
		"value": 1.25
	},
	{
		"name": "Midas Touch",
		"price": 30000,
		"description": "You gain more points per crystal!",
		"texture": AtlasTexture,
		"x": 3,
		"y": 27,
		"attribute": "score",
		"value": 1.25
	},
	{
		"name": "Castle Key",
		"price": 50000,
		"description": "It unlocks Castle Stages!",
		"texture": AtlasTexture,
		"x": 1,
		"y": 2,
		"attribute": "defense",
		"value": 1
	},
	{
		"name": "Strong Heart",
		"price": 10000,
		"description": "It increases your health!",
		"texture": AtlasTexture,
		"x": 5,
		"y": 1,
		"attribute": "health",
		"value": 1.25
	},
	{
		"name": "Big Boots",
		"price": 25000,
		"description": "It increases your jump height!",
		"texture": AtlasTexture,
		"x": 4,
		"y": 16,
		"attribute": "jump",
		"value": 1.2
	},
	{
		"name": "Golden Shield",
		"price": 30000,
		"description": "It significantly increases your defense!",
		"texture": AtlasTexture,
		"x": 2,
		"y": 18,
		"attribute": "defense",
		"value": 1.8
	}
]

var stages = [
	{
		"id": 1,
		"world": 1,
		"tag": "stage_1_1",
		"score": 0,
		"finished": true
	},
	{
		"id": 2,
		"world": 1,
		"tag": "stage_2_1",
		"score": 0,
		"finished": true
	},
	{
		"id": 3,
		"world": 1,
		"tag": "stage_3_1",
		"score": 0,
		"finished": true
	},
	{
		"id": 4,
		"world": 1,
		"tag": "stage_4_1",
		"score": 0,
		"finished": true
	},
	{
		"id": 5,
		"world": 1,
		"tag": "stage_5_1",
		"score": 0,
		"finished": true
	},
	{
		"id": 1,
		"world": 2,
		"tag": "stage_1_2",
		"score": 0,
		"finished": true
	},
	{
		"id": 2,
		"world": 2,
		"tag": "stage_2_2",
		"score": 0,
		"finished": true
	},
	{
		"id": 3,
		"world": 2,
		"tag": "stage_3_2",
		"score": 0,
		"finished": true
	},
	{
		"id": 4,
		"world": 2,
		"tag": "stage_4_2",
		"score": 0,
		"finished": false
	},
	{
		"id": 5,
		"world": 2,
		"tag": "stage_5_2",
		"score": 0,
		"finished": false
	},
	{
		"id": 1,
		"world": 3,
		"tag": "stage_1_3",
		"score": 0,
		"finished": false
	},
	{
		"id": 2,
		"world": 3,
		"tag": "stage_2_3",
		"score": 0,
		"finished": false
	},
	{
		"id": 3,
		"world": 3,
		"tag": "stage_3_3",
		"score": 0,
		"finished": false
	},
	{
		"id": 4,
		"world": 3,
		"tag": "stage_4_3",
		"score": 0,
		"finished": false
	},
	{
		"id": 5,
		"world": 3,
		"tag": "stage_5_3",
		"score": 0,
		"finished": false
	}
]

var player_characters = [characters[7]]

var player_items = []
