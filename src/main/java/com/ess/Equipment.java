package com.ess;

public class Equipment{

    private int id; //May change to UUID if large enough system
    private String name;
    private EquipmentType type;
    private String location; //May be a different class
    private EquipmentStatus status;
    private boolean needsMaintenance;
    private int totalRunningHours;
    private int totalHours;

    public Equipment(int id, String name, EquipmentType type, String location, EquipmentStatus status, boolean needsMaintenance){
        this.id = id;
        this.name = name;
        this.type = type;
        this.location = location;
        this.status = EquipmentStatus.OFFLINE;
        this.totalRunningHours = 0;
        this.totalHours = 0;
    }

    public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append("");
        return sb.toString();
    }

    public int hashCode(){
        return (int) this.id + 
        this.name.hashCode() + 
        this.type.hashCode() + 
        this.location.hashCode() + 
        this.status.hashCode() + 
        this.totalRunningHours +
        this.totalHours;
    }

    private boolean equals(Equipment eq1){
        if (eq1.hashCode() == this.hashCode()){
            if(eq1.name == this.name && 
            eq1.id == this.id &&
            eq1.location == this.location &&
            eq1.totalRunningHours == this.totalRunningHours &&
            eq1.totalHours == this.totalHours){

               return true; 
            }
        }
        return false;
    }

}