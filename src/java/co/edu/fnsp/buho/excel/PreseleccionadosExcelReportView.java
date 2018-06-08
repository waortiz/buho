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
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
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
        header.createCell(0).setCellValue("Identificación");
        header.createCell(1).setCellValue("Sexo");
        header.createCell(2).setCellValue("Perfil");
        header.createCell(3).setCellValue("Tiempo experiencia docente");
        header.createCell(4).setCellValue("Tiempo de experiencia laboral");

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
