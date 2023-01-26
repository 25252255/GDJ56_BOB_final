package com.today.bab.onedayclass.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AdminMaster {
   private String memberId;
   private String history; //Ȱ���̷�
   private Date apply; //��û��¥
   private String info; //��û��
   private String name; //�����
   private String ing; //�����Ȳ
   private Date testDate; //�ɻ糯¥
}
