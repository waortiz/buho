package co.edu.fnsp.buho.entidades;

public enum PrivilegioEnum {
    USUARIO(1);

    private final int idPrivilegio;

    private PrivilegioEnum(int idPrivilegio) {
        this.idPrivilegio = idPrivilegio;
    }

    public int getIdPrivilegio() {
        return idPrivilegio;
    }

}
