

(* ��ʶ���������ַ��� *)
type ident = string

(* ��Ԫ����� *)
type binop =
  | Add     (* + *)
  | Sub     (* - *)
  | Mul     (* * *)
  | Div     (* / *)
  | Mod     (* % *)
  | Eq      (* == *)
  | Neq     (* != *)
  | Lt      (* < *)
  | Leq     (* <= *)
  | Gt      (* > *)
  | Geq     (* >= *)
  | And     (* && *)
  | Or      (* || *)

(* һԪ����� *)
type unop =
  | Neg     (* - *)
  | Not     (* ! *)

(* ���ʽ *)
type expr =
  | Int of int                      (* ��������, e.g., 10 *)
  | Var of ident                    (* ��������, e.g., x *)
  | UnaryOp of unop * expr          (* һԪ����, e.g., !a *)
  | BinaryOp of binop * expr * expr (* ��Ԫ����, e.g., a + b *)
  | Call of ident * expr list       (* ��������, e.g., foo(a, b) *)

(* ��� *)
type stmt =
  | Empty                             (* �����, e.g., ; *)
  | Expr of expr                      (* ���ʽ���, e.g., foo(); *)
  | Block of stmt list                (* ����, e.g., { ... } *)
  | Return of expr option             (* �������, e.g., return a; or return; *)
  | If of expr * stmt * stmt option   (* if-else ���, e.g., if (c) s1 else s2 *)
  | While of expr * stmt              (* while ѭ��, e.g., while (c) s *)
  | Break                             (* break; *)
  | Continue                          (* continue; *)
  | Declare of ident * expr           (* �����������ʼ��, e.g., int a = 10; *)
  | Assign of ident * expr            (* ������ֵ, e.g., a = 20; *)


(* ������������ *)
type return_type =
  | Void
  | Int

(* �����β� *)
type param =
  | Param of ident (* int a *)

(* �������� *)
type func_def = {
  ret_type : return_type;
  name     : ident;
  params   : param list;
  body     : stmt; (* ����������һ�� Block *)
}

(* ���뵥Ԫ������������ *)
type comp_unit = func_def list