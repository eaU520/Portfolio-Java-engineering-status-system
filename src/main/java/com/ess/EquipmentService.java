package com.ess;

import java.util.ArrayList;
import java.util.List;
public class EquipmentService {
    private final List<Equipment> equipmentList = new ArrayList<>();

    public void addEquipment(Equipment equipment){
        if(equipment == null){
            throw new IllegalArgumentException("Input is invalid");
        }
        if (findEquipment(equipment.getId()) == null){
            equipmentList.add(equipment);
        }else{
            System.out.println("The equipment ID already exists");
        }   
    }

    public Equipment findEquipment(int id){
        return equipmentList.stream()
        .filter(equipment -> id == equipment.getId())
        .findAny()
        .orElse(null);
    }

    public boolean deleteEquipment(int id){
        if (findEquipment(id) != null){
            equipmentList.removeIf(element -> element.getId() == id);
            return true;
        }
        return false;
    }

    public List<Equipment> getAllEquipment(){
        return List.copyOf(equipmentList);
    }

    public boolean updateStatus(int id, EquipmentStatus newStatus){
        if (newStatus == null){
            throw new IllegalArgumentException("Input is invalid");
        }
        Equipment foundEqt = findEquipment(id);
        if ( foundEqt != null){
            foundEqt.setEquipmentStatus(newStatus);
            return true;
        }
        return false;
    }
}