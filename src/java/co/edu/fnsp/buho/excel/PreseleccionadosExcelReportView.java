/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.excel;

import co.edu.fnsp.buho.entidades.Preseleccionado;
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
public class PreseleccionadosExcelReportView extends AbstractExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> map, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setHeader("Content-Disposition", "attachment;filename=\"preseleccionados.xls\"");
        List<Preseleccionado> preseleccionados = (List<Preseleccionado>) map.get("preseleccionados");
        Sheet sheet = workbook.createSheet("Preseleccionados");
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
        
        header.createCell(0).setCellValue("Identificación");
        header.getCell(0).setCellStyle(style);
        sheet.setColumnWidth(0, 15*256);
        header.createCell(1).setCellValue("Sexo");
        header.getCell(1).setCellStyle(style);
        sheet.setColumnWidth(1, 15*256);
        header.createCell(2).setCellValue("Perfil");
        header.getCell(2).setCellStyle(style);
        sheet.setColumnWidth(2, 60*256);
        header.createCell(3).setCellValue("Tiempo experiencia docente");
        header.getCell(3).setCellStyle(style);
        sheet.setColumnWidth(3, 35*256);
        header.createCell(4).setCellValue("Tiempo de experiencia laboral");
        header.getCell(4).setCellStyle(style);
        sheet.setColumnWidth(4, 35*256);

        int rowNum = 1;
        for (Preseleccionado preseleccionado : preseleccionados) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(preseleccionado.getNumeroIdentificacion());
            row.createCell(1).setCellValue(preseleccionado.getSexo());
            row.createCell(2).setCellValue(preseleccionado.getPerfil());
            row.createCell(3).setCellValue(preseleccionado.getTiempoExperienciaDocente());
            row.createCell(4).setCellValue(preseleccionado.getTiempoExperienciaLaboral());
        }
    }

}
