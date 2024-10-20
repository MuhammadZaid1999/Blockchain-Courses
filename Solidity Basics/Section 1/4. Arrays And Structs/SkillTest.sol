// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SkillTest {
    struct Animal {
        string name;
        uint age;
    }
    Animal[]  public animalList;

    function storeAnimal() public  {
        Animal memory animal1 = Animal("Cat", 10);
        Animal memory animal2 = Animal("Dog", 30);
        Animal memory animal3 = Animal("Goat", 50);

        animalList.push(animal1);
        animalList.push(animal2);
        animalList.push(animal3);
    }

    

    function addAnimal(string calldata name, uint8 age) external  {
        animalList.push(Animal(name, age));
    }
}
