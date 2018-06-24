/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.fnsp.buho.excel;

import co.edu.fnsp.buho.entidades.Evaluacion;
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
public class EvaluacionExcelReportView extends AbstractExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> map, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setHeader("Content-Disposition", "attachment;filename=\"evaluacionPreseleccionados.xls\"");
        List<Evaluacion> evaluaciones = (List<Evaluacion>) map.get("evaluaciones");
        Sheet sheet = workbook.createSheet("Evaluaciones");
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
        
        header.createCell(0).setCellValue("Número");
        header.getCell(0).setCellStyle(style);
        sheet.setColumnWidth(0, 15*256);
        header.createCell(1).setCellValue("Identificación");
        header.getCell(1).setCellStyle(style);
        sheet.setColumnWidth(1, 15*256);
        header.createCell(2).setCellValue("Formación académica");
        header.getCell(2).setCellStyle(style);
        sheet.setColumnWidth(2, 25*256);
        header.createCell(3).setCellValue("Capacitación en docencia y pedagogía");
        header.getCell(3).setCellStyle(style);
        sheet.setColumnWidth(3, 50*256);
        header.createCell(4).setCellValue("Experiencia en docencia en instituciones de educación superior");
        header.getCell(4).setCellStyle(style);
        sheet.setColumnWidth(4, 60*256);
        header.createCell(5).setCellValue("Experiencia en investigación");
        header.getCell(5).setCellStyle(style);
        sheet.setColumnWidth(5, 35*256);
        header.createCell(6).setCellValue("Experiencia en extensión");
        header.getCell(6).setCellStyle(style);
        sheet.setColumnWidth(6, 35*256);
        header.createCell(7).setCellValue("Experiencia profesional en el sector salud y salud pública");
        header.getCell(7).setCellStyle(style);
        sheet.setColumnWidth(7, 60*256);
        header.createCell(8).setCellValue("Total");
        header.getCell(8).setCellStyle(style);
        sheet.setColumnWidth(8, 15*256);
        int rowNum = 1;
        for (Evaluacion evaluacion : evaluaciones) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(rowNum - 1);
            row.createCell(1).setCellValue(evaluacion.getNumeroIdentificacion());
            row.createCell(2).setCellValue(evaluacion.getFormacionAcademica());
            row.createCell(3).setCellValue(evaluacion.getCapacitacionDocenciaPedagogia());
            row.createCell(4).setCellValue(evaluacion.getExperienciaDocenciaInstitucionesEducacionSuperior());
            row.createCell(5).setCellValue(evaluacion.getExperienciaInvestigacion());
            row.createCell(6).setCellValue(evaluacion.getExperienciaExtension());
            row.createCell(7).setCellValue(evaluacion.getExperienciaProfesionalSectorSalud());
            row.createCell(8).setCellValue(evaluacion.getTotal());
        }
    }

}
