({double subtotal, double total, double ivaValor})calcularFactura ({required double precio, int unidades = 1, double iva = 0.21}) {
  final subtotal = precio * unidades;
  final ivaValor = subtotal * iva;
  final total = subtotal + ivaValor;

  return(subtotal: subtotal, total: total, ivaValor: ivaValor);
}
void main() {
  print(calcularFactura(precio: 500, unidades: 4));
}