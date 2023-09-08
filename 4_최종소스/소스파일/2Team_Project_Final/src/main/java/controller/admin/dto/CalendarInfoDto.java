package controller.admin.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import vo.admin.CalendarInfo;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class CalendarInfoDto {
	private List<CalendarInfo> list;
}
