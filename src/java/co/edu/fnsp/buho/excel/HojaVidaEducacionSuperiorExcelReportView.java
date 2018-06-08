/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.excel;

import co.edu.fnsp.buho.entidades.HojaVidaEducacionSuperior;
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
public class HojaVidaEducacionSuperiorExcelReportView extends AbstractExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> map, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setHeader("Content-Disposition", "attachment;filename=\"hojasVidaEducacionSuperior.xls\"");
        List<HojaVidaEducacionSuperior> hojasVida = (List<HojaVidaEducacionSuperior>) map.get("hojasVida");
        Sheet sheet = workbook.createSheet("Educación Superior");
        Row header = sheet.createRow(0);
        header.createCell(0).setCellValue("Cédula");
        header.createCell(1).setCellValue("Nombres");
        header.createCell(2).setCellValue("Apellidos");
        header.createCell(3).setCellValue("Institución");
        header.createCell(4).setCellValue("Núcleo básico de conocimiento");
        header.createCell(5).setCellValue("Año graduación");
        header.createCell(6).setCellValue("Nivel estudio");
        header.createCell(7).setCellValue("Título Extranjero");
        header.createCell(8).setCellValue("Validado");

        int rowNum = 1;
        for (HojaVidaEducacionSuperior hojaVida : hojasVida) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(hojaVida.getNumeroIdentificacion());
            row.createCell(1).setCellValue(hojaVida.getNombres());
            row.createCell(2).setCellValue(hojaVida.getApellidos());
            row.createCell(3).setCellValue(hojaVida.getInstitucion());
            row.createCell(4).setCellValue(hojaVida.getNucleoBasicoConocimiento());
            if(hojaVida.getAnyoGraduacion() != null) {
                row.createCell(5).setCellValue(hojaVida.getAnyoGraduacion());
            } else {
                row.createCell(5).setCellValue("");
            }
            row.createCell(6).setCellValue(hojaVida.getNivelEstudio());
            row.createCell(7).setCellValue(hojaVida.getTituloExterior());
            row.createCell(8).setCellValue(hojaVida.getValidado());
        }
    }

}
