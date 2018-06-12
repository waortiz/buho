/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.excel;

import co.edu.fnsp.buho.entidades.HojaVidaEducacionContinua;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.web.servlet.view.document.AbstractExcelView;

/**
 *
 * @author William
 */
public class HojaVidaEducacionContinuaExcelReportView extends AbstractExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> map, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setHeader("Content-Disposition", "attachment;filename=\"hojasVidaEducacionNoFormal.xls\"");
        List<HojaVidaEducacionContinua> hojasVida = (List<HojaVidaEducacionContinua>) map.get("hojasVida");
        Sheet sheet = workbook.createSheet("Educación Continua");
        Row header = sheet.createRow(0);
        header.createCell(0).setCellValue("Cédula");
        header.createCell(1).setCellValue("Nombres");
        header.createCell(2).setCellValue("Apellidos");
        header.createCell(3).setCellValue("Curso");
        header.createCell(4).setCellValue("Núcleo básico de conocimiento");
        header.createCell(5).setCellValue("Duración");

        int rowNum = 1;
        for (HojaVidaEducacionContinua hojaVida : hojasVida) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(hojaVida.getNumeroIdentificacion());
            row.createCell(1).setCellValue(hojaVida.getNombres());
            row.createCell(2).setCellValue(hojaVida.getApellidos());
            row.createCell(3).setCellValue(hojaVida.getCurso());
            row.createCell(4).setCellValue(hojaVida.getNucleoBasicoConocimiento());
            row.createCell(5).setCellValue(hojaVida.getNumeroHoras());
        }
    }

}
