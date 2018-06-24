/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.excel;

import co.edu.fnsp.buho.entidades.HojaVidaExperienciaDocencia;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.web.servlet.view.document.AbstractExcelView;

/**
 *
 * @author William
 */
public class HojaVidaExperienciaDocenciaExcelReportView extends AbstractExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> map, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setHeader("Content-Disposition", "attachment;filename=\"hojasVidaExperienciaDocencia.xls\"");
        List<HojaVidaExperienciaDocencia> hojasVida = (List<HojaVidaExperienciaDocencia>) map.get("hojasVida");
        Sheet sheet = workbook.createSheet("Tipo de Experiencia");
        Row header = sheet.createRow(0);
        
        HSSFCellStyle style = workbook.createCellStyle();
        HSSFFont fontHead = workbook.createFont();
        fontHead.setBold(true);
        style.setFont(fontHead); 
        style.setBorderBottom(CellStyle.BORDER_THIN);
        style.setBorderLeft(CellStyle.BORDER_THIN);
        style.setBorderRight(CellStyle.BORDER_THIN);
        style.setBorderTop(CellStyle.BORDER_THIN);
        style.setAlignment(HorizontalAlignment.CENTER);
        
        header.createCell(0).setCellValue("Cédula");
        header.getCell(0).setCellStyle(style);
        sheet.setColumnWidth(0, 15*256);
        header.createCell(1).setCellValue("Nombres");
        header.getCell(1).setCellStyle(style);
        sheet.setColumnWidth(1, 15*256);
        header.createCell(2).setCellValue("Apellidos");
        header.getCell(2).setCellStyle(style);
        sheet.setColumnWidth(2, 15*256);
        header.createCell(3).setCellValue("Curso");
        header.getCell(3).setCellStyle(style);
        sheet.setColumnWidth(3, 15*256);
        header.createCell(4).setCellValue("Institución");
        header.getCell(4).setCellStyle(style);
        sheet.setColumnWidth(4, 15*256);
        header.createCell(5).setCellValue("Total horas");
        header.getCell(5).setCellStyle(style);
        sheet.setColumnWidth(5, 15*256);
        header.createCell(6).setCellValue("Núcleo básico de conocimiento");
        header.getCell(6).setCellStyle(style);
        sheet.setColumnWidth(6, 60*256);
        header.createCell(7).setCellValue("Validado");
        header.getCell(7).setCellStyle(style);
        sheet.setColumnWidth(7, 15*256);
        
        int rowNum = 1;
        for (HojaVidaExperienciaDocencia hojaVida : hojasVida) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(hojaVida.getNumeroIdentificacion());
            row.createCell(1).setCellValue(hojaVida.getNombres());
            row.createCell(2).setCellValue(hojaVida.getApellidos());
            row.createCell(3).setCellValue(hojaVida.getCurso());
            row.createCell(4).setCellValue(hojaVida.getInstitucion());
            row.createCell(5).setCellValue(hojaVida.getNumeroHoras());
            row.createCell(6).setCellValue(hojaVida.getNucleoBasicoConocimiento());
            row.createCell(7).setCellValue(hojaVida.getValidado());
        }
    }

}
