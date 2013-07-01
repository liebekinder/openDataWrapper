package opendatawrapper;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class ShellExecutor {

	private String stdinFlag;
	private String shell;

	public ShellExecutor(String shell, String stdinFlag) {
		this.shell = shell;
		this.stdinFlag = stdinFlag;
	}

	public String execute(String cmdLine) throws IOException {
		StringBuilder sb = new StringBuilder();
		Runtime run = Runtime.getRuntime();
		System.out.println(shell);
		Process pr = run.exec(cmdLine);
		BufferedWriter bufWr = new BufferedWriter(new OutputStreamWriter(
				pr.getOutputStream()));
		bufWr.write(cmdLine);
		try {
			pr.waitFor();
		} catch (InterruptedException e) {
		}
		BufferedReader buf = new BufferedReader(new InputStreamReader(
				pr.getInputStream()));
		String line = "";
		while ((line = buf.readLine()) != null) {
			sb.append(line + "\n");
		}
		return sb.toString();
	}
}