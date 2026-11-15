package com.ess;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;
class EquipmentServiceTest{
    private EquipmentService eService;

    @BeforeEach
    void reset() {
        eService = new EquipmentService();
    }

    @Test
    void addEquipmentSuccess() {
        Equipment pump = new Equipment (1, "Electric Pump",  EquipmentType.PUMP, "Main Building");
        //TODO: Make locations a class or enum 

        asserEquals(0, eService.getAllEquipment().size());

        eService.addEquipment(pump);

        assertEquals(1, eService.getAllEquipment().size());
        assertEquals("Electric Pump", eService.findEquipment(1).getName());
    }
    @Test
    void duplicateReject(){
        Equipment pump = new Equipment (1, "Electric Pump",  EquipmentType.PUMP, "Main Building");
        //TODO: Make locations a class or enum 

        asserEquals(0, eService.getAllEquipment().size());

        eService.addEquipment(pump);

        assertEquals(1, eService.getAllEquipment().size());
        assertEquals("Electric Pump", eService.findEquipment(1).getName());

        asserEquals(1, eService.getAllEquipment().size());

        Equipment plc = new Equipment (1, "Main PLC",  EquipmentType.PLC, "Main Building");
        
        assertThrows(IllegalArgumentException.class, () -> eService.addEquipment(plc));
        asserEquals(1, eService.getAllEquipment().size());
    }
}
