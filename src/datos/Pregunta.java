package datos;

import java.util.ArrayList;
import java.util.List;

public class Pregunta {
	private int idPregunta;
	private String texto;
	private int valorAprobado;
	private TipoPregunta tipoPregunta;
	List <Opcion> lstOpciones;
	
	public Pregunta() {}
	
	public Pregunta(int idPregunta, String texto, int valorAprobado, TipoPregunta tipoPregunta) {
		super();
		this.idPregunta = idPregunta;
		this.texto = texto;
		this.valorAprobado = valorAprobado;
		this.tipoPregunta = tipoPregunta;
		this.lstOpciones = new ArrayList<>();
	}

	public TipoPregunta getTipoPregunta() {
		return tipoPregunta;
	}

	public void setTipoPregunta(TipoPregunta tipoPregunta) {
		this.tipoPregunta = tipoPregunta;
	}

	public List<Opcion> getLstOpciones() {
		return lstOpciones;
	}

	public void setLstOpciones(List<Opcion> lstOpciones) {
		this.lstOpciones = lstOpciones;
	}

	public int getIdPregunta() {
		return idPregunta;
	}

	public void setIdPregunta(int idPregunta) {
		this.idPregunta = idPregunta;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

	public int getValorAprobado() {
		return valorAprobado;
	}

	public void setValorAprobado(int valorAprobado) {
		this.valorAprobado = valorAprobado;
	}

	@Override
	public String toString() {
		String retorno = "Pregunta\nId: " + idPregunta + "\n" + texto + "\nvalor de aprobacion: " + valorAprobado;
		retorno+= "\nopciones\n";
		for (Opcion o : lstOpciones) {
			retorno+="\n" +  o.toString();
		}
		return retorno;
	}
	
	
	
}
