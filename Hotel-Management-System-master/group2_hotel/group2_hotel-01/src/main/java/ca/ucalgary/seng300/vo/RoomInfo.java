package ca.ucalgary.seng300.vo;

import lombok.*;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@SuppressWarnings("unused")
public class RoomInfo {
    String roomType;
    Integer EmptyRoomsLeft;
    Integer price;
}
