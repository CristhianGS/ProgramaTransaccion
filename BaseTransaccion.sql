PGDMP                         x            Transacciones    12.3    12.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    17756    Transacciones    DATABASE     �   CREATE DATABASE "Transacciones" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Mexico.1252' LC_CTYPE = 'Spanish_Mexico.1252';
    DROP DATABASE "Transacciones";
                postgres    false            �            1255    24597    cadena()    FUNCTION     �   CREATE FUNCTION public.cadena() RETURNS character
    LANGUAGE plpgsql
    AS $$
	declare
	nueva_cadena text;
	begin
	nueva_cadena = 	md5(random()::text);
	return nueva_cadena;
	end;
	$$;
    DROP FUNCTION public.cadena();
       public          postgres    false            �            1255    24609 	   cadena2()    FUNCTION       CREATE FUNCTION public.cadena2() RETURNS character
    LANGUAGE plpgsql
    AS $$
	
	begin 
	select  string_agg(x, '') from (
	 select chr(ascii('a') + floor(random() * 26)::integer) 
    FROM generate_series(1,10 + b * 0) 
	) AS y(x);
	return generar;
	end;
	$$;
     DROP FUNCTION public.cadena2();
       public          postgres    false            �            1255    24608    cadena2(integer, integer)    FUNCTION       CREATE FUNCTION public.cadena2(numero1 integer, numero2 integer) RETURNS character
    LANGUAGE plpgsql
    AS $$
	begin 
	select  string_agg(x, '') from (
	 select chr(ascii('a') + floor(random() * 26)::integer) 
    FROM generate_series(1,10) 
	) AS y(x);
	return generar;
	end;
	$$;
 @   DROP FUNCTION public.cadena2(numero1 integer, numero2 integer);
       public          postgres    false            �            1255    24610 	   cadena3()    FUNCTION     �   CREATE FUNCTION public.cadena3() RETURNS character
    LANGUAGE plpgsql
    AS $$
	--declarar variables;
	
	begin  --procesp;
	return trunc( 10 *random()) FROM generate_series(); 
	end;
	$$;
     DROP FUNCTION public.cadena3();
       public          postgres    false            �            1255    24623    cadenaletras(integer)    FUNCTION     K  CREATE FUNCTION public.cadenaletras(length integer) RETURNS text
    LANGUAGE plpgsql
    AS $$ 
declare chars text[] := '{a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z}'; 
result text := '';
begin
for i in 1..length loop
result := result || chars[1+random()*(array_length(chars, 1)-1)]; 
end loop; 
return result; 
end;
$$;
 3   DROP FUNCTION public.cadenaletras(length integer);
       public          postgres    false            �            1255    24618    cadenanumero(integer, integer)    FUNCTION     �   CREATE FUNCTION public.cadenanumero(numeromin integer, numeromax integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$	
	begin --proceso;
	return trunc(random()* numeroMax + numeroMin);
	--ROUND(RANDOM() * 100trunc
	end;
	$$;
 I   DROP FUNCTION public.cadenanumero(numeromin integer, numeromax integer);
       public          postgres    false            �            1255    24614    cadenanumeros()    FUNCTION     �   CREATE FUNCTION public.cadenanumeros() RETURNS character
    LANGUAGE plpgsql
    AS $$	
	begin  --proceso;
	return ROUND(RANDOM() * 100);
	end;
	$$;
 &   DROP FUNCTION public.cadenanumeros();
       public          postgres    false            �            1255    24617    cadenanumeros(integer, integer)    FUNCTION     �   CREATE FUNCTION public.cadenanumeros(numeromin integer, numero_max integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$	
	begin  --proceso;
	return round(random()* numeroMax + numeroMin);
	--ROUND(RANDOM() * 100trunc
	end;
	$$;
 K   DROP FUNCTION public.cadenanumeros(numeromin integer, numero_max integer);
       public          postgres    false            �            1255    24632 "   crudestudiante(integer, character)    FUNCTION     ;  CREATE FUNCTION public.crudestudiante(accion integer, cedulas character) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
	DECLARE 
	--accionGuardado int (1);
	v_mensajeGuardado character varying;
	v_mensajeEliminado character varying;
	v_mensajeActualizado character varying;
	BEGIN
		
		update estudiante set nombre=p_nombre, edad=p_edad
				 where cedula=p_cedula;
				v_mensajeActualizado='Estudiante  Actualizado exitosamente'; 
		return    v_mensajeActualizado;      
		
		delete from estudiante where cedula=p_cedula;
				v_mensajeEliminado='Estudiante  eliminado exitosamente'; 
		return    v_mensajeEliminado;
		
		   insert into estudiante(cedula,nombre,edad)
				VALUES (p_cedula,p_nombre,p_edad);
				v_mensajeGuardado='Estudiante registrado exitosamente'; 
		return    v_mensajeGuardado;    
		
	END;
	$$;
 H   DROP FUNCTION public.crudestudiante(accion integer, cedulas character);
       public          postgres    false            �            1255    24650 6   crudestudiante(integer, character, character, integer)    FUNCTION     �  CREATE FUNCTION public.crudestudiante(e_accion integer, e_cedula character, e_nombre character, e_edad integer) RETURNS character
    LANGUAGE plpgsql
    AS $$
	DECLARE 
	mensaje character (40);
	BEGIN
	
	CASE
	WHEN (e_accion = 1)THEN
		insert into estudiante(cedula,nombre,edad)
			VALUES (e_cedula,e_nombre,e_edad);
				mensaje ='Estudiante registrado exitosamente'; 
	WHEN (e_accion = 2)THEN	
			delete from estudiante where cedula=e_cedula;
				mensaje ='Estudiante  eliminado exitosamente'; 
	when (e_accion = 3)then
		update estudiante set nombre= e_nombre, edad= e_edad
				where cedula=e_cedula;
				mensaje ='Estudiante Actualizado exitosamente'; 
	else
	mensaje := 'Verificar Datos';
	
	END CASE;
	return mensaje;
	end;
	$$;
 o   DROP FUNCTION public.crudestudiante(e_accion integer, e_cedula character, e_nombre character, e_edad integer);
       public          postgres    false            �            1255    24593 
   funcion3()    FUNCTION     �   CREATE FUNCTION public.funcion3() RETURNS integer
    LANGUAGE plpgsql
    AS $$
	BEGIN
	RETURN trunc(random()*200000+1);
	ENd;
	$$;
 !   DROP FUNCTION public.funcion3();
       public          postgres    false            �            1255    24615    generate_series()    FUNCTION     �   CREATE FUNCTION public.generate_series() RETURNS character
    LANGUAGE plpgsql
    AS $$
	--declarar variables;
	
	begin  --procesp;
	return ROUND(RANDOM()*100); --FROM generate_series(); 
	end;
	$$;
 (   DROP FUNCTION public.generate_series();
       public          postgres    false            �            1255    24595 
   make_uid()    FUNCTION     X  CREATE FUNCTION public.make_uid() RETURNS text
    LANGUAGE plpgsql
    AS $$ 
DECLARE 
    new_uid text; 
    done bool; 
BEGIN 
    done := false; 
    WHILE NOT done LOOP 
     new_uid := md5(''||now()::text||random()::text); 
     done := NOT exists(SELECT 1 FROM my_table WHERE uid=new_uid); 
    END LOOP; 
    RETURN new_uid; 
END; 
$$;
 !   DROP FUNCTION public.make_uid();
       public          postgres    false            �            1255    24616    numerosrandom(integer, integer)    FUNCTION     �   CREATE FUNCTION public.numerosrandom(minimo integer, maximo integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$ 
begin
return trunc(random()* maximo + minimo);
end;
$$;
 D   DROP FUNCTION public.numerosrandom(minimo integer, maximo integer);
       public          postgres    false            �            1255    24611    random_string(integer)    FUNCTION     L  CREATE FUNCTION public.random_string(length integer) RETURNS text
    LANGUAGE plpgsql
    AS $$ 
declare chars text[] := '{a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z}'; 
result text := '';
begin
for i in 1..length loop
result := result || chars[1+random()*(array_length(chars, 1)-1)]; 
end loop; 
return result; 
end;
$$;
 4   DROP FUNCTION public.random_string(length integer);
       public          postgres    false            �            1255    24630 G   sp_estudiante_actualizar(character varying, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.sp_estudiante_actualizar(p_cedula character varying, p_nombre character varying, p_edad integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
	DECLARE
	v_mensaje character varying;
	BEGIN		
			   update estudiante set nombre=p_nombre, edad=p_edad
				 where cedula=p_cedula;
				v_mensaje='Estudiante  Actualizado exitosamente'; 
		return    v_mensaje;      
	END;
	$$;
 w   DROP FUNCTION public.sp_estudiante_actualizar(p_cedula character varying, p_nombre character varying, p_edad integer);
       public          postgres    false            �            1255    24631 )   sp_estudiante_eliminar(character varying)    FUNCTION     D  CREATE FUNCTION public.sp_estudiante_eliminar(p_cedula character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
	DECLARE
	v_mensaje character varying;
	BEGIN		
			   delete from estudiante where cedula=p_cedula;
				v_mensaje='Estudiante  eliminado exitosamente'; 
		return    v_mensaje;      
	END;
	$$;
 I   DROP FUNCTION public.sp_estudiante_eliminar(p_cedula character varying);
       public          postgres    false            �            1255    24629 D   sp_estudiante_guardar(character varying, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.sp_estudiante_guardar(p_cedula character varying, p_nombre character varying, p_edad integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
	DECLARE
	v_mensaje character varying;
	BEGIN		
			   insert into estudiante(cedula,nombre,edad)
				VALUES (p_cedula,p_nombre,p_edad);
				v_mensaje='Estudiante registrado exitosamente'; 
		return    v_mensaje;      
	END;
	$$;
 t   DROP FUNCTION public.sp_estudiante_guardar(p_cedula character varying, p_nombre character varying, p_edad integer);
       public          postgres    false            �            1255    24594    sumar(integer, integer)    FUNCTION     �   CREATE FUNCTION public.sumar(numero1 integer, numero2 integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
	DECLARE 
	resultado int;
	BEGIN
	resultado= numero1 + numero2;
	RETURN resultado;
	END;
	$$;
 >   DROP FUNCTION public.sumar(numero1 integer, numero2 integer);
       public          postgres    false            �            1259    17784    usuarios    TABLE     �  CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character(50),
    numero_cuenta double precision,
    saldo_cuenta double precision,
    CONSTRAINT usuarios_nombre_check CHECK ((nombre > ''::bpchar)),
    CONSTRAINT usuarios_numero_cuenta_check CHECK ((numero_cuenta > (0)::double precision)),
    CONSTRAINT usuarios_saldo_cuenta_check CHECK ((saldo_cuenta > (0)::double precision))
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    17782    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public          postgres    false    203                       0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public          postgres    false    202            �
           2604    17787    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203                      0    17784    usuarios 
   TABLE DATA           K   COPY public.usuarios (id, nombre, numero_cuenta, saldo_cuenta) FROM stdin;
    public          postgres    false    203   3                  0    0    usuarios_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.usuarios_id_seq', 1, false);
          public          postgres    false    202            �
           2606    17792    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    203               �   x���;�0�z}
� �z׿!����iH)��QP���bX\ �f�����K{�;��a̵�ɱhl�IY8N���U�fj~=����u�S2���"8��m�.ϐ��1�c(���� ��b(���U�K��{������_��Q�I�z����2�8�����A��b(,�s���B	H-     