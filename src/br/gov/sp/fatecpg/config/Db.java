package br.gov.sp.fatecpg.config;

import java.util.ArrayList;

public class Db {

	private static ArrayList<Cliente> clientes;

	public static ArrayList<Cliente> getClientes() {
		if (clientes == null) {
			clientes = new ArrayList<>();
			Cliente clie = new Cliente();
			clie.setNome("Cadu");
			clie.setCpf("49240603800");
			clie.setRg("123456785");
			clie.setEmail("cadu@cadu.com");
			clie.setTelefone("13982102086");
			clie.setEndereco("rua joao paulo");
			clientes.add(clie);
		}
		return clientes;
	}
}