-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Out-2021 às 04:23
-- Versão do servidor: 10.4.20-MariaDB
-- versão do PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `app_gerenciamento_concessionaria`
--
CREATE DATABASE IF NOT EXISTS `app_gerenciamento_concessionaria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `app_gerenciamento_concessionaria`;

DELIMITER $$
--
-- Procedimentos
--
DROP PROCEDURE IF EXISTS `att_preço`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `att_preço` (IN `novo_valor` DECIMAL, `codveiculo` INT)  BEGIN

update tb_modelos novos
set preco = novo_valor
where idmodelo_novo = codveiculo;

END$$

DROP PROCEDURE IF EXISTS `sp_att_cep_concessionaria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_att_cep_concessionaria` (`cep` VARCHAR(255), `cod` INT)  BEGIN

UPDATE tb_concessionarias
SET cep_concessionaria = cep
WHERE cod_concessionaria = cod;

END$$

DROP PROCEDURE IF EXISTS `sp_att_contato_funcionario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_att_contato_funcionario` (`novo_contato` VARCHAR(25), `idfun` INT)  BEGIN

UPDATE tb_funcionarios
SET contato = novo_contato
WHERE id_funcionario = idfun;

END$$

DROP PROCEDURE IF EXISTS `sp_att_funcep`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_att_funcep` (`funcep` VARCHAR(45), `idfun` INT)  BEGIN

UPDATE tb_funcionarios
SET endereco = funcep
WHERE id_funcionario = idfun;

END$$

DROP PROCEDURE IF EXISTS `sp_att_perfil`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_att_perfil` (IN `status_usuario` VARCHAR(45), `codusuario` INT)  BEGIN
update tb_usuarios
set    status_perfil = status_usuario
where id_usuario = codusuario;
END$$

DROP PROCEDURE IF EXISTS `sp_att_salario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_att_salario` (IN `novo_salario` VARCHAR(55), `funcionarioid` INT)  BEGIN

UPDATE tb_funcionarios
SET salario = novo_salario
WHERE id_funcionario = funcionarioid;

END$$

DROP PROCEDURE IF EXISTS `sp_demissão`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_demissão` (`cod` INT)  BEGIN

DELETE FROM tb_funcionarios WHERE id_funcionario = cod;

END$$

DROP PROCEDURE IF EXISTS `sp_find_cliente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_find_cliente` (IN `cod` INT)  BEGIN

SELECT * FROM tb_clientes
where id_cliente = cod;

END$$

DROP PROCEDURE IF EXISTS `sp_find_usuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_find_usuario` (`find_user` INT)  BEGIN

SELECT * FROM tb_usuarios 
WHERE nome LIKE CONCAT('%', find_user, '%');


END$$

DROP PROCEDURE IF EXISTS `sp_marca_nova`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_marca_nova` (IN `marca` VARCHAR(45))  BEGIN

INSERT INTO tb_marcas(nome) values (marca);

END$$

DROP PROCEDURE IF EXISTS `sp_novo_modelonovo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_novo_modelonovo` (`nome_carro` VARCHAR(45), `idnovo` INT)  BEGIN

UPDATE tb_modelos_novos
SET nome = nome_carro
WHERE idmodelo_novo = idnovo;

END$$

DROP PROCEDURE IF EXISTS `sp_novo_modelo_semi`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_novo_modelo_semi` (`nome_carro` VARCHAR(45), `id_seminovo` INT)  BEGIN

UPDATE modelo_seminovos
SET nome = nome_carro 
WHERE idmodelo_seminovos = id_seminovo;

END$$

DROP PROCEDURE IF EXISTS `sp_num_concessionarias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_num_concessionarias` (OUT `quant` INT)  BEGIN

SELECT COUNT(*) INTO quant FROM tb_concessionarias;

END$$

DROP PROCEDURE IF EXISTS `sp_num_funcionarios`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_num_funcionarios` (OUT `num` INT)  BEGIN

SELECT COUNT(*) INTO num FROM tb_funcionarios;

END$$

DROP PROCEDURE IF EXISTS `sp_reset_password`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_reset_password` (IN `nova_senha` VARCHAR(45), `confirmar_nova_senha` VARCHAR(45), `user` INT)  BEGIN
UPDATE tb_usuarios
SET senha = MD5(nova_senha), confirmar_senha = MD5(confirmar_nova_senha)
WHERE id_usuario = user;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
CREATE TABLE `tb_categoria` (
  `codigo_categoria` int(11) NOT NULL,
  `categoria` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_categoria`
--

INSERT INTO `tb_categoria` (`codigo_categoria`, `categoria`) VALUES
(1, 'Hatch'),
(2, 'Sedan'),
(3, 'Picape'),
(4, 'SUV'),
(5, 'Aventureiro compacto'),
(6, 'Hatch subcompacto'),
(7, 'Hatch compacto'),
(8, 'Hatch médio'),
(9, 'Van grande'),
(10, 'Esportivo médio'),
(11, 'Esportivo compacto'),
(12, 'SUV grande'),
(13, 'SUV compacto'),
(14, 'Familiar grande'),
(15, 'Picape compacta'),
(16, 'Picape média'),
(17, 'Picape grande'),
(18, 'Esportivo grande'),
(19, 'Conversível compacto'),
(20, 'Conversível médio'),
(21, 'Conversível grande'),
(22, 'Van média'),
(23, 'Jipe'),
(24, 'Furgão compacto'),
(25, 'Furgão médio'),
(26, 'Caminhão urbano'),
(27, 'Jipe grande'),
(28, 'Jipe médio'),
(29, 'Jipe compacto'),
(30, 'Jipe subcompacto'),
(31, 'SUV grande'),
(32, 'SUV médio'),
(33, 'SUV compacto'),
(34, 'SUV subcompacto'),
(35, 'Cupê grande'),
(36, 'Cupê médio'),
(37, 'Cupê compacto'),
(38, 'Cupê subcompacto'),
(39, 'Crossover grande'),
(40, 'Crossover médio'),
(41, 'Crossover compacto'),
(42, 'Crossover subcompacto'),
(43, 'Wagon grande'),
(44, 'Wagon médio'),
(45, 'Wagon compacto'),
(46, 'Wagon subcompacto'),
(47, 'Conversível grande'),
(48, 'Conversível médio'),
(49, 'Conversível compacto'),
(50, 'Conversível subcompacto'),
(51, 'Luxo grande'),
(52, 'Luxo médio'),
(53, 'Luxo compacto'),
(54, 'Luxo subcompacto'),
(55, 'Híbrido ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_clientes`
--

DROP TABLE IF EXISTS `tb_clientes`;
CREATE TABLE `tb_clientes` (
  `id_cliente` int(11) NOT NULL,
  `compras` tinytext NOT NULL,
  `cod_compra` int(21) NOT NULL,
  `contato` varchar(45) NOT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `nome` longtext DEFAULT NULL,
  `endereco` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_clientes`
--

INSERT INTO `tb_clientes` (`id_cliente`, `compras`, `cod_compra`, `contato`, `cpf`, `nome`, `endereco`) VALUES
(1, 'Hatch', 1, '(61) 99347-4416', '730.056.107-13', 'Bruno Pedro Henrique', 'Rua José Teodoro de Andrade'),
(2, 'Sedan', 2, '(86) 98457-7728', '722.820.455-72', 'Clara Cecília Aparício', 'Rua Valério Caldas Magalhães'),
(3, 'Picape', 3, '(21) 98790-5829', '631.287.101-04', 'Oliver Renato Lucas ', 'Rua Manoel Pinheiro Machado'),
(4, 'SUV', 4, '(21) 98417-5281', '302.846.733-07', 'Marcela Isabella ', 'Praça da República'),
(5, 'Aventureiro compacto', 5, '(16) 99778-3990', '650.828.107-07', 'Emilly Esther Almeida', 'Rodovia Índio Tibiriçá'),
(6, 'Hatch subcompacto', 6, '(98) 99876-5350', '734.874.813-91', 'Caleb Victor Gonçalves', 'Rua Ponciano Maciel Maia Giorgis'),
(7, 'Hatch compacto', 7, '(69) 99248-0686', '204.612.103-12', 'Bruno Thales Oliver ', 'Rua Desembargador Freitas'),
(8, 'Hatch médio', 8, '(62) 98590-8060', '455.532.667-93', 'Nina Benedita', 'Rua Joaquim Alves Taveira'),
(9, 'Van grande', 9, '(63) 98199-5359', '844.571.623-96', 'Cauã Igor Samuel ', 'Quadra Quadra 63'),
(10, 'Esportivo médio', 10, '(83) 98916-6320', '005.649.136-00', 'Henrique Yuri Enrico ', 'Rua Praia dos Prazeres'),
(11, 'Esportivo compacto', 11, '(86) 98233-8335', '162.099.016-46', 'Nicole Flávia Barbosa', 'Rua João Batista de Mendonça'),
(12, 'SUV grande', 12, '(47) 99162-5514', '031.069.499-02', 'Marli Caroline da Costa', 'Rua Benedito Ferreira'),
(13, 'SUV compacto', 13, '(28) 98547-9643', '879.512.873-50', 'Cauã Manoel Luís Brito', 'Rua Dona Iracema de Almeida'),
(14, 'Familiar grande', 14, '(95) 98271-9480', '140.418.763-46', 'Sophia Beatriz Viana', 'Travessa M'),
(15, 'Picape compacta', 15, '(67) 98665-9997', '959.824.873-92', 'Laura Luiza Araújo', 'Avenida 3ª Avenida'),
(16, 'Picape média', 16, '(41) 98449-3528', '834.529.919-97', 'Noah Alexandre ', 'Passagem Doze de Agosto'),
(17, 'Picape grande', 17, '(28) 98539-4856', '195.335.044-55', 'Luiz Marcos Vinicius', 'Rua Malacacheta'),
(18, 'Esportivo grande', 18, '(21) 98781-5252', '451.682.301-21', 'Gustavo Rodrigo', 'Quadra 1007 Sul Alameda 14'),
(19, 'Conversível compacto', 19, '(69) 98708-6020', '845.610.377-21', 'Tomás Victor Kauê ', 'Rua Bem Querer'),
(20, 'Conversível médio', 20, '(67) 98798-0008', '604.895.451-49', 'Maitê Alana Porto', 'Vila Coriolando Coutinho'),
(21, 'Conversível grande', 21, '(47) 98134-5304', '411.962.189-86', 'Geraldo Manoel', 'Rua Galdino Moro'),
(22, 'Van média', 22, '(82) 99955-9762', '717.756.308-38', 'Maria Jaqueline Márcia', 'Avenida Coaracy Nunes 97'),
(23, 'Jipe', 23, '(82) 99680-6312', '881.258.182-00', 'Francisca Carolina ', 'Rua 14'),
(24, 'Furgão compacto', 24, '(86) 98806-5705', '564.277.943-53', 'Fátima Carolina Sara', 'Ilha Patauateua, s/n Chácara Barreiras'),
(25, 'Furgão médio', 25, '(44) 98230-8043', '828.915.933-16', 'Betina Olivia Andrea ', 'Rua Santa Eufrásia'),
(26, 'Caminhão urbano', 26, '(22) 99998-0686', '143.687.126-33', 'Renato Tiago Miguel', 'Quadra J'),
(27, 'Jipe grande', 27, '(11) 98835-5340', '167.637.088-90', 'Yasmin Clarice Ramos', 'Avenida do Rio Bonito'),
(28, 'Jipe médio', 28, '(11) 99123-0612', '413.009.168-93', 'Arthur Roberto Alves', 'Rua Barão de Pirapama'),
(29, 'Jipe compacto', 29, '(19) 99884-4489', '637.331.168-60', 'Noah Leonardo Manuel Melo', 'Rua Aroldo Nolasco dos Santos'),
(30, 'Jipe subcompacto', 30, '(19) 99534-5319', '962.322.618-79', 'Sebastião Matheus Caleb Moraes', 'Avenida Orozimbo Maia'),
(31, 'SUV grande', 31, '(13) 99140-5386', '524.316.718-52', 'Betina Luiza Bernardes', 'Praia do Manduba'),
(32, 'SUV médio', 32, '(11) 99815-0815', '662.768.518-33', 'Tomás Carlos Pietro Rezende', 'Rua da Capela'),
(33, 'SUV compacto', 33, '(11) 98935-6174', '776.683.168-68', 'Priscila Eloá Betina Araújo', 'Rua Primavera'),
(34, 'SUV subcompacto', 34, '(15) 98962-2465', '176.609.048-68', 'Fátima Heloise Novaes', 'Alameda Dinamarca'),
(35, 'Cupê grande', 35, '(12) 98811-1196', '052.878.898-10', 'Carla Fernanda Marcela Barros', 'Rua Santa Paulina'),
(36, 'Cupê médio', 36, '(11) 99432-6561', '418.634.438-86', 'Bruno Eduardo Fogaça', 'Rua Jorge Rosa'),
(37, 'Cupê compacto', 37, '(18) 98205-2290', '726.344.838-64', 'Marcos Guilherme Paulo Drumond', 'Rua Itapura'),
(38, 'Cupê subcompacto', 38, '(15) 99380-3947', '549.954.288-01', 'Osvaldo Marcos Carvalho', 'Rua Jairo Grillo de Lima'),
(39, 'Crossover grande', 39, '(14) 99748-2521', '868.750.278-87', 'Raul Kaique Lorenzo Drumond', 'Alameda das Grevílias'),
(40, 'Crossover médio', 40, '(11) 98853-6811', '818.791.208-10', 'Mariane Márcia Isabel Moraes', 'Rua da Várzea 240'),
(41, 'Crossover compacto', 41, '(19) 99131-0148', '727.639.518-99', 'Eduarda Laís Isis Drumond', 'Rua das Aroeiras'),
(42, 'Crossover subcompacto', 42, '(13) 98410-3731', '716.135.068-99', 'Cristiane Sabrina Agatha Jesus', 'Rua das Helicônias'),
(43, 'Wagon grande', 43, '(12) 98222-7965', '355.234.938-30', 'Anderson Hugo Caio Ferreira', 'Avenida Carlos Roberto Magalhães Reis'),
(44, 'Wagon médio', 44, '(13) 98915-7191', '884.067.958-83', 'Emilly Márcia Silva', 'Rua Guido Romanesi'),
(45, 'Wagon compacto', 45, '(18) 98528-0728', '728.044.778-35', 'Cláudia Sueli Isadora Novaes', 'Rua João Manoel Gomes'),
(46, 'Wagon subcompacto', 46, '(11) 98901-5976', '582.990.298-21', 'Sônia Helena Fernanda Costa', 'Rua Alcides Otoboni Beraldi'),
(47, 'Conversível grande', 47, '(11) 98609-1247', '256.390.188-01', 'Diogo Danilo Fábio Lima', 'Rua Ubirajara de Barros Gomes Martins'),
(48, 'Conversível médio', 48, '(15) 99147-4348', '266.391.608-03', 'Benjamin Benício Aparício', 'Rua Max Maria do Vale'),
(49, 'Conversível compacto', 49, '(14) 98537-2055', '776.314.618-48', 'Nina Camila Aparício', 'Rua Manoel Theóphilo Pinto Ribeiro'),
(50, 'Conversível subcompacto', 50, '(11) 98672-4464', '032.727.878-10', 'Renata Stella Marina da Mota', 'Travessa Francisco Arajá'),
(51, 'Luxo grande', 51, '(11) 99582-0156', '444.157.098-85', 'Enzo Anderson Benedito Barros', 'Rua Matsujiro Kuroiwa'),
(52, 'Luxo médio', 52, '(18) 98856-7077', '314.278.548-58', 'Renata Elza Oliveira', 'Rua Izabel Becegato Costa'),
(53, 'Luxo compacto', 53, '(19) 99806-1834', '588.555.928-74', 'Vera Lavínia Barros', 'Rua João Miguel Helena'),
(54, 'Luxo subcompacto', 54, '(19) 99502-7931', '873.615.588-87', 'Leandro Tiago Silveira', 'Rua Nelson Omegna'),
(55, 'Híbrido ', 55, '(19) 99276-9789', '311.645.468-05', 'Clara Mariah Sophia Aparício', 'Rua Sete');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_concessionarias`
--

DROP TABLE IF EXISTS `tb_concessionarias`;
CREATE TABLE `tb_concessionarias` (
  `cod_concessionaria` int(3) NOT NULL,
  `id_gerente` int(7) DEFAULT NULL,
  `nome_gerente` tinytext NOT NULL,
  `contato_gerente` varchar(255) NOT NULL,
  `cpf_gerente` varchar(255) NOT NULL,
  `cep_concessionaria` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_concessionarias`
--

INSERT INTO `tb_concessionarias` (`cod_concessionaria`, `id_gerente`, `nome_gerente`, `contato_gerente`, `cpf_gerente`, `cep_concessionaria`) VALUES
(1, 292, 'Fernanda Vitória', '(41) 73041-9879', '737.539.080-02', 'Rua Eduardo Carlos Pereira'),
(2, 317, 'Henry Tomás', '(59) 47596-8195', '271.910.780-81', 'Rua Felício Guilherme'),
(3, 310, 'Valentina Andrea', '(73) 88113-7747', '103.752.970-73', 'Rua Romildo Rodrigues de Lima'),
(4, 202, 'José Thales Nicolas', '(84) 25292-9060', '817.516.680-02', 'Rua Professor Augusto Elias Salles'),
(5, 385, 'Filipe Gustavo', '(17) 23160-1027', '614.393.330-84', 'Rua Apóstolo Paulo'),
(6, 223, 'Camila Lavínia', '(69) 11505-7215', '364.070.640-40', 'Rua Cardeal Villot'),
(7, 262, 'Nicole Yasmin', '(47) 36846-2741', '584.615.370-41', 'Rua Alcebíades Perecin'),
(8, 245, 'Giovanna Ester', '(46) 88502-4107', '398.444.870-80', 'Rua José Antônio Almeida Gonzaga'),
(9, 391, 'Lucas Edson', '(57) 43658-5307', '674.135.980-00', 'Rua Gonçalina dos Reis Cardoso'),
(10, 124, 'Sebastião Mário', '(71) 52590-9812', '145.448.540-08', 'Rua João Sorio'),
(11, 101, 'Sabrina Lara', '(68) 54965-9400', '516.006.480-02', 'Rua Nilce Rustice Ribeiro'),
(12, 88, 'Carlos Eduardo', '(37) 19032-2060', '177.496.240-31', 'Rua Hermínia de Biasi Faria'),
(13, 89, 'Pietro Samuel', '(17) 76032-6601', '315.625.230-15', 'Praça Coronel Joaquim Estanislau de Arruda'),
(14, 136, 'Noah Oliver', '(79) 40254-3395', '851.524.690-22', 'Rua José Justino Pereira'),
(15, 364, 'Raul Manoel', '(84) 79639-7804', '579.226.680-82', 'Avenida Piraporinha 1000'),
(16, 317, 'Diego Breno Silva', '(23) 55571-2048', '053.646.370-00', 'Rua Monte Azul Paulista'),
(17, 97, 'Guilherme Carlos', '(52) 69209-0879', '721.264.470-65', 'Rua Heitor dos Prazeres'),
(18, 187, 'Analu Sarah', '(42) 75633-7868', '970.859.020-78', 'Viela Lírio dos Vales'),
(19, 249, 'Sebastião Mário', '(48) 49445-0142', '347.750.320-11', 'Rua Cerro Corá 792'),
(20, 284, 'Danilo Manoel', '(72) 82440-2606', '964.146.940-10', 'Praça Tenente Jayro Baptistão'),
(21, 280, 'José Julio Aragão', '(22) 39115-1230', '870.387.340-40', 'Rua das Camélias'),
(22, 149, 'Luna Mariana', '(50) 43841-9757', '104.877.540-26', 'Rua Deputado Guilherme Gomes'),
(23, 209, 'Ruan Mateus', '(27) 20699-5198', '210.136.440-93', 'Rua Quatorze de Abril'),
(24, 203, 'Caio Matheus', '(77) 23133-9124', '803.296.040-66', 'Rua Doutor Silva Leme'),
(25, 341, 'Giovanna Eloá', '(76) 54564-8057', '288.253.450-70', 'Travessa do Menino'),
(26, 349, 'Sebastião Nicolas', '(41) 50224-6905', '232.577.010-98', 'Rua Roque Aparecido Bernardo'),
(27, 324, 'Fernanda Vitória', '2147483647', '2147483647', 'Rua Eduardo Carlos Pereira'),
(28, 178, 'Henry Tomás', '2147483647', '2147483647', 'Rua Felício Guilherme'),
(29, 223, 'Valentina Andrea', '2147483647', '2147483647', 'Rua Romildo Rodrigues de Lima'),
(30, 181, 'José Thales Nicolas', '2147483647', '2147483647', 'Rua Professor Augusto Elias Salles'),
(31, 193, 'Filipe Gustavo', '2147483647', '2147483647', 'Rua Apóstolo Paulo'),
(32, 372, 'Camila Lavínia', '2147483647', '2147483647', 'Rua Cardeal Villot'),
(33, 187, 'Nicole Yasmin', '4736846', '2147483647', 'Rua Alcebíades Perecin'),
(34, 123, 'Giovanna Ester', '4688502', '2147483647', 'Rua José Antônio Almeida Gonzaga'),
(35, 356, 'Lucas Edson', '2147483647', '2147483647', 'Rua Gonçalina dos Reis Cardoso'),
(36, 316, 'Sebastião Mário', '2147483647', '2147483647', 'Rua João Sorio'),
(37, 117, 'Sabrina Lara', '2147483647', '2147483647', 'Rua Nilce Rustice Ribeiro'),
(38, 289, 'Carlos Eduardo', '2147483647', '2147483647', 'Rua Hermínia de Biasi Faria'),
(39, 346, 'Pietro Samuel', '2147483647', '2147483647', 'Praça Coronel Joaquim Estanislau de Arruda'),
(40, 117, 'Noah Oliver', '2147483647', '2147483647', 'Rua José Justino Pereira'),
(41, 202, 'Raul Manoel', '2147483647', '2147483647', 'Avenida Piraporinha 1000'),
(42, 262, 'Diego Breno Silva', '2147483647', '2147483647', 'Rua Monte Azul Paulista'),
(43, 307, 'Guilherme Carlos', '2147483647', '2147483647', 'Rua Heitor dos Prazeres'),
(44, 354, 'Analu Sarah', '2147483647', '2147483647', 'Viela Lírio dos Vales'),
(45, 100, 'Sebastião Mário', '2147483647', '2147483647', 'Rua Cerro Corá 792'),
(46, 93, 'Danilo Manoel', '2147483647', '2147483647', 'Praça Tenente Jayro Baptistão'),
(47, 119, 'José Julio Aragão', '2147483647', '2147483647', 'Rua das Camélias'),
(48, 270, 'Luna Mariana', '2147483647', '2147483647', 'Rua Deputado Guilherme Gomes'),
(49, 244, 'Ruan Mateus', '2147483647', '2147483647', 'Rua Quatorze de Abril'),
(50, 363, 'Caio Matheus', '2147483647', '2147483647', 'Rua Doutor Silva Leme'),
(51, 340, 'Giovanna Eloá', '7654564', '2147483647', 'Travessa do Menino'),
(52, 211, 'Sebastião Nicolas', '2147483647', '2147483647', 'Rua Roque Aparecido Bernardo'),
(53, 341, 'Fernanda Vitória', '2147483647', '2147483647', 'Rua Eduardo Carlos Pereira'),
(54, 325, 'Henry Tomás', '2147483647', '2147483647', 'Rua Felício Guilherme'),
(55, 206, 'Valentina Andrea', '2147483647', '2147483647', 'Rua Romildo Rodrigues de Lima'),
(56, 356, 'José Thales Nicolas', '2147483647', '2147483647', 'Rua Professor Augusto Elias Salles'),
(57, 68, 'Filipe Gustavo', '2147483647', '2147483647', 'Rua Apóstolo Paulo'),
(58, 274, 'Camila Lavínia', '2147483647', '2147483647', 'Rua Cardeal Villot'),
(59, 72, 'Nicole Yasmin', '4736846', '2147483647', 'Rua Alcebíades Perecin'),
(60, 190, 'Giovanna Ester', '4688502', '2147483647', 'Rua José Antônio Almeida Gonzaga'),
(61, 336, 'Lucas Edson', '2147483647', '2147483647', 'Rua Gonçalina dos Reis Cardoso'),
(62, 365, 'Sebastião Mário', '2147483647', '2147483647', 'Rua João Sorio'),
(63, 69, 'Sabrina Lara', '2147483647', '2147483647', 'Rua Nilce Rustice Ribeiro'),
(64, 253, 'Carlos Eduardo', '2147483647', '2147483647', 'Rua Hermínia de Biasi Faria'),
(65, 313, 'Pietro Samuel', '2147483647', '2147483647', 'Praça Coronel Joaquim Estanislau de Arruda'),
(66, 61, 'Noah Oliver', '2147483647', '2147483647', 'Rua José Justino Pereira'),
(67, 367, 'Raul Manoel', '2147483647', '2147483647', 'Avenida Piraporinha 1000'),
(68, 208, 'Diego Breno Silva', '2147483647', '2147483647', 'Rua Monte Azul Paulista'),
(69, 243, 'Guilherme Carlos', '2147483647', '2147483647', 'Rua Heitor dos Prazeres'),
(70, 194, 'Analu Sarah', '2147483647', '2147483647', 'Viela Lírio dos Vales'),
(71, 192, 'Sebastião Mário', '2147483647', '2147483647', 'Rua Cerro Corá 792'),
(72, 334, 'Danilo Manoel', '2147483647', '2147483647', 'Praça Tenente Jayro Baptistão'),
(73, 345, 'José Julio Aragão', '2147483647', '2147483647', 'Rua das Camélias'),
(74, 327, 'Luna Mariana', '2147483647', '2147483647', 'Rua Deputado Guilherme Gomes'),
(75, 204, 'Ruan Mateus', '2147483647', '2147483647', 'Rua Quatorze de Abril'),
(76, 342, 'Caio Matheus', '2147483647', '2147483647', 'Rua Doutor Silva Leme'),
(77, 352, 'Giovanna Eloá', '7654564', '2147483647', 'Travessa do Menino'),
(78, 338, 'Sebastião Nicolas', '2147483647', '2147483647', 'Rua Roque Aparecido Bernardo'),
(79, 237, 'Fernanda Vitória', '2147483647', '2147483647', 'Rua Eduardo Carlos Pereira'),
(80, 123, 'Henry Tomás', '2147483647', '2147483647', 'Rua Felício Guilherme'),
(81, 207, 'Valentina Andrea', '2147483647', '2147483647', 'Rua Romildo Rodrigues de Lima'),
(82, 270, 'José Thales Nicolas', '2147483647', '2147483647', 'Rua Professor Augusto Elias Salles'),
(83, 334, 'Filipe Gustavo', '2147483647', '2147483647', 'Rua Apóstolo Paulo'),
(84, 115, 'Camila Lavínia', '2147483647', '2147483647', 'Rua Cardeal Villot'),
(85, 223, 'Nicole Yasmin', '4736846', '2147483647', 'Rua Alcebíades Perecin'),
(86, 375, 'Giovanna Ester', '4688502', '2147483647', 'Rua José Antônio Almeida Gonzaga'),
(87, 108, 'Lucas Edson', '2147483647', '2147483647', 'Rua Gonçalina dos Reis Cardoso'),
(88, 69, 'Sebastião Mário', '2147483647', '2147483647', 'Rua João Sorio'),
(89, 324, 'Sabrina Lara', '2147483647', '2147483647', 'Rua Nilce Rustice Ribeiro'),
(90, 316, 'Carlos Eduardo', '2147483647', '2147483647', 'Rua Hermínia de Biasi Faria'),
(91, 211, 'Pietro Samuel', '2147483647', '2147483647', 'Praça Coronel Joaquim Estanislau de Arruda'),
(92, 63, 'Noah Oliver', '2147483647', '2147483647', 'Rua José Justino Pereira'),
(93, 332, 'Raul Manoel', '2147483647', '2147483647', 'Avenida Piraporinha 1000'),
(94, 378, 'Diego Breno Silva', '2147483647', '2147483647', 'Rua Monte Azul Paulista'),
(95, 147, 'Guilherme Carlos', '2147483647', '2147483647', 'Rua Heitor dos Prazeres'),
(96, 255, 'Analu Sarah', '2147483647', '2147483647', 'Viela Lírio dos Vales'),
(97, 87, 'Sebastião Mário', '2147483647', '2147483647', 'Rua Cerro Corá 792'),
(98, 323, 'Danilo Manoel', '2147483647', '2147483647', 'Praça Tenente Jayro Baptistão'),
(99, 256, 'José Julio Aragão', '2147483647', '2147483647', 'Rua das Camélias'),
(100, 266, 'Luna Mariana', '2147483647', '2147483647', 'Rua Deputado Guilherme Gomes'),
(101, 164, 'Ruan Mateus', '2147483647', '2147483647', 'Rua Quatorze de Abril'),
(102, 327, 'Caio Matheus', '2147483647', '2147483647', 'Rua Doutor Silva Leme'),
(103, 48, 'Giovanna Eloá', '7654564', '2147483647', 'Travessa do Menino'),
(104, 259, 'Sebastião Nicolas', '2147483647', '2147483647', 'Rua Roque Aparecido Bernardo'),
(105, 58, 'Fernanda Vitória', '2147483647', '2147483647', 'Rua Eduardo Carlos Pereira'),
(106, 163, 'Henry Tomás', '2147483647', '2147483647', 'Rua Felício Guilherme'),
(107, 246, 'Valentina Andrea', '2147483647', '2147483647', 'Rua Romildo Rodrigues de Lima'),
(108, 346, 'José Thales Nicolas', '2147483647', '2147483647', 'Rua Professor Augusto Elias Salles'),
(109, 244, 'Filipe Gustavo', '2147483647', '2147483647', 'Rua Apóstolo Paulo'),
(110, 138, 'Camila Lavínia', '2147483647', '2147483647', 'Rua Cardeal Villot'),
(111, 259, 'Nicole Yasmin', '4736846', '2147483647', 'Rua Alcebíades Perecin'),
(112, 137, 'Giovanna Ester', '4688502', '2147483647', 'Rua José Antônio Almeida Gonzaga'),
(113, 209, 'Lucas Edson', '2147483647', '2147483647', 'Rua Gonçalina dos Reis Cardoso'),
(114, 240, 'Sebastião Mário', '2147483647', '2147483647', 'Rua João Sorio'),
(115, 174, 'Sabrina Lara', '2147483647', '2147483647', 'Rua Nilce Rustice Ribeiro'),
(116, 103, 'Carlos Eduardo', '2147483647', '2147483647', 'Rua Hermínia de Biasi Faria'),
(117, 299, 'Pietro Samuel', '2147483647', '2147483647', 'Praça Coronel Joaquim Estanislau de Arruda'),
(118, 89, 'Noah Oliver', '2147483647', '2147483647', 'Rua José Justino Pereira'),
(119, 200, 'Raul Manoel', '2147483647', '2147483647', 'Avenida Piraporinha 1000'),
(120, 339, 'Diego Breno Silva', '2147483647', '2147483647', 'Rua Monte Azul Paulista'),
(121, 346, 'Guilherme Carlos', '2147483647', '2147483647', 'Rua Heitor dos Prazeres'),
(122, 318, 'Analu Sarah', '2147483647', '2147483647', 'Viela Lírio dos Vales'),
(123, 154, 'Sebastião Mário', '2147483647', '2147483647', 'Rua Cerro Corá 792'),
(124, 118, 'Danilo Manoel', '2147483647', '2147483647', 'Praça Tenente Jayro Baptistão'),
(125, 84, 'José Julio Aragão', '2147483647', '2147483647', 'Rua das Camélias'),
(126, 369, 'Luna Mariana', '2147483647', '2147483647', 'Rua Deputado Guilherme Gomes'),
(127, 148, 'Ruan Mateus', '2147483647', '2147483647', 'Rua Quatorze de Abril'),
(128, 287, 'Caio Matheus', '2147483647', '2147483647', 'Rua Doutor Silva Leme'),
(129, 245, 'Giovanna Eloá', '7654564', '2147483647', 'Travessa do Menino'),
(130, 317, 'Sebastião Nicolas', '2147483647', '2147483647', 'Rua Roque Aparecido Bernardo'),
(131, 101, 'Fernanda Vitória', '2147483647', '2147483647', 'Rua Eduardo Carlos Pereira'),
(132, 209, 'Henry Tomás', '2147483647', '2147483647', 'Rua Felício Guilherme'),
(133, 345, 'Valentina Andrea', '2147483647', '2147483647', 'Rua Romildo Rodrigues de Lima'),
(134, 351, 'José Thales Nicolas', '2147483647', '2147483647', 'Rua Professor Augusto Elias Salles'),
(135, 323, 'Filipe Gustavo', '2147483647', '2147483647', 'Rua Apóstolo Paulo'),
(136, 167, 'Camila Lavínia', '2147483647', '2147483647', 'Rua Cardeal Villot'),
(137, 169, 'Nicole Yasmin', '4736846', '2147483647', 'Rua Alcebíades Perecin'),
(138, 297, 'Giovanna Ester', '4688502', '2147483647', 'Rua José Antônio Almeida Gonzaga'),
(139, 231, 'Lucas Edson', '2147483647', '2147483647', 'Rua Gonçalina dos Reis Cardoso'),
(140, 218, 'Sebastião Mário', '2147483647', '2147483647', 'Rua João Sorio'),
(141, 351, 'Sabrina Lara', '2147483647', '2147483647', 'Rua Nilce Rustice Ribeiro'),
(142, 353, 'Carlos Eduardo', '2147483647', '2147483647', 'Rua Hermínia de Biasi Faria'),
(143, 316, 'Pietro Samuel', '2147483647', '2147483647', 'Praça Coronel Joaquim Estanislau de Arruda'),
(144, 124, 'Noah Oliver', '2147483647', '2147483647', 'Rua José Justino Pereira'),
(145, 327, 'Raul Manoel', '2147483647', '2147483647', 'Avenida Piraporinha 1000'),
(146, 166, 'Diego Breno Silva', '2147483647', '2147483647', 'Rua Monte Azul Paulista'),
(147, 151, 'Guilherme Carlos', '2147483647', '2147483647', 'Rua Heitor dos Prazeres'),
(148, 211, 'Analu Sarah', '2147483647', '2147483647', 'Viela Lírio dos Vales'),
(149, 204, 'Sebastião Mário', '2147483647', '2147483647', 'Rua Cerro Corá 792'),
(150, 341, 'Danilo Manoel', '2147483647', '2147483647', 'Praça Tenente Jayro Baptistão'),
(151, 348, 'José Julio Aragão', '2147483647', '2147483647', 'Rua das Camélias'),
(152, 321, 'Luna Mariana', '2147483647', '2147483647', 'Rua Deputado Guilherme Gomes'),
(153, 164, 'Ruan Mateus', '2147483647', '2147483647', 'Rua Quatorze de Abril'),
(154, 158, 'Caio Matheus', '2147483647', '2147483647', 'Rua Doutor Silva Leme'),
(155, 254, 'Giovanna Eloá', '7654564', '2147483647', 'Travessa do Menino'),
(156, 49, 'Sebastião Nicolas', '2147483647', '2147483647', 'Rua Roque Aparecido Bernardo'),
(157, 136, 'Fernanda Vitória', '41730419879', '73753908002', 'Rua Eduardo Carlos Pereira'),
(158, 136, 'Henry Tomás', '59475968195', '27191078081', 'Rua Felício Guilherme'),
(159, 224, 'Valentina Andrea', '73881137747', '10375297073', 'Rua Romildo Rodrigues de Lima'),
(160, 318, 'José Thales Nicolas', '84252929060', '81751668002', 'Rua Professor Augusto Elias Salles'),
(161, 169, 'Filipe Gustavo', '17231601027', '61439333084', 'Rua Apóstolo Paulo'),
(162, 196, 'Camila Lavínia', '69115057215', '36407064040', 'Rua Cardeal Villot'),
(163, 75, 'Nicole Yasmin', '4736846-2741', '58461537041', 'Rua Alcebíades Perecin'),
(164, 91, 'Giovanna Ester', '4688502-4107', '39844487080', 'Rua José Antônio Almeida Gonzaga'),
(165, 184, 'Lucas Edson', '57436585307', '67413598000', 'Rua Gonçalina dos Reis Cardoso'),
(166, 251, 'Sebastião Mário', '71525909812', '14544854008', 'Rua João Sorio'),
(167, 305, 'Sabrina Lara', '68549659400', '51600648002', 'Rua Nilce Rustice Ribeiro'),
(168, 375, 'Carlos Eduardo', '37190322060', '17749624031', 'Rua Hermínia de Biasi Faria'),
(169, 213, 'Pietro Samuel', '17760326601', '31562523015', 'Praça Coronel Joaquim Estanislau de Arruda'),
(170, 245, 'Noah Oliver', '79402543395', '85152469022', 'Rua José Justino Pereira'),
(171, 187, 'Raul Manoel', '84796397804', '57922668082', 'Avenida Piraporinha 1000'),
(172, 156, 'Diego Breno Silva', '23555712048', '05364637000', 'Rua Monte Azul Paulista'),
(173, 172, 'Guilherme Carlos', '52692090879', '72126447065', 'Rua Heitor dos Prazeres'),
(174, 343, 'Analu Sarah', '42756337868', '97085902078', 'Viela Lírio dos Vales'),
(175, 105, 'Sebastião Mário', '48494450142', '34775032011', 'Rua Cerro Corá 792'),
(176, 149, 'Danilo Manoel', '72824402606', '96414694010', 'Praça Tenente Jayro Baptistão'),
(177, 384, 'José Julio Aragão', '22391151230', '87038734040', 'Rua das Camélias'),
(178, 376, 'Luna Mariana', '50438419757', '10487754026', 'Rua Deputado Guilherme Gomes'),
(179, 331, 'Ruan Mateus', '27206995198', '21013644093', 'Rua Quatorze de Abril'),
(180, 132, 'Caio Matheus', '77231339124', '80329604066', 'Rua Doutor Silva Leme'),
(181, 321, 'Giovanna Eloá', '7654564-8057', '28825345070', 'Travessa do Menino'),
(182, 113, 'Sebastião Nicolas', '41502246905', '23257701098', 'Rua Roque Aparecido Bernardo'),
(183, 253, 'Fernanda Vitória', '41730419879', '73753908002', 'Rua Eduardo Carlos Pereira'),
(184, 182, 'Henry Tomás', '59475968195', '27191078081', 'Rua Felício Guilherme'),
(185, 105, 'Valentina Andrea', '73881137747', '10375297073', 'Rua Romildo Rodrigues de Lima'),
(186, 281, 'José Thales Nicolas', '84252929060', '81751668002', 'Rua Professor Augusto Elias Salles'),
(187, 345, 'Filipe Gustavo', '17231601027', '61439333084', 'Rua Apóstolo Paulo'),
(188, 134, 'Camila Lavínia', '69115057215', '36407064040', 'Rua Cardeal Villot'),
(189, 288, 'Nicole Yasmin', '4736846-2741', '58461537041', 'Rua Alcebíades Perecin'),
(190, 292, 'Giovanna Ester', '4688502-4107', '39844487080', 'Rua José Antônio Almeida Gonzaga'),
(191, 201, 'Lucas Edson', '57436585307', '67413598000', 'Rua Gonçalina dos Reis Cardoso'),
(192, 82, 'Sebastião Mário', '71525909812', '14544854008', 'Rua João Sorio'),
(193, 109, 'Sabrina Lara', '68549659400', '51600648002', 'Rua Nilce Rustice Ribeiro'),
(194, 254, 'Carlos Eduardo', '37190322060', '17749624031', 'Rua Hermínia de Biasi Faria'),
(195, 194, 'Pietro Samuel', '17760326601', '31562523015', 'Praça Coronel Joaquim Estanislau de Arruda'),
(196, 163, 'Noah Oliver', '79402543395', '85152469022', 'Rua José Justino Pereira'),
(197, 187, 'Raul Manoel', '84796397804', '57922668082', 'Avenida Piraporinha 1000'),
(198, 49, 'Diego Breno Silva', '23555712048', '05364637000', 'Rua Monte Azul Paulista'),
(199, 336, 'Guilherme Carlos', '52692090879', '72126447065', 'Rua Heitor dos Prazeres'),
(200, 88, 'Analu Sarah', '42756337868', '97085902078', 'Viela Lírio dos Vales'),
(201, 86, 'Sebastião Mário', '48494450142', '34775032011', 'Rua Cerro Corá 792'),
(202, 118, 'Danilo Manoel', '72824402606', '96414694010', 'Praça Tenente Jayro Baptistão'),
(203, 288, 'José Julio Aragão', '22391151230', '87038734040', 'Rua das Camélias'),
(204, 338, 'Luna Mariana', '50438419757', '10487754026', 'Rua Deputado Guilherme Gomes'),
(205, 78, 'Ruan Mateus', '27206995198', '21013644093', 'Rua Quatorze de Abril'),
(206, 383, 'Caio Matheus', '77231339124', '80329604066', 'Rua Doutor Silva Leme'),
(207, 232, 'Giovanna Eloá', '7654564-8057', '28825345070', 'Travessa do Menino'),
(208, 314, 'Sebastião Nicolas', '41502246905', '23257701098', 'Rua Roque Aparecido Bernardo'),
(228, NULL, 'Ian Miguel Silva', '(14) 3773-3768', '352.036.638-07', 'Rua Procópio Ferreira'),
(245, NULL, 'Lorena Alana Alves', '(11) 98551-2236', '907.917.808-05', 'Rua Floripes Aragão Lopes'),
(251, NULL, 'Cristiane Heloisa Bernardes', '(19) 99732-9323', '589.570.538-32', 'Avenida Manoel Ruz Peres'),
(271, NULL, 'Rita Laís Nunes', '(11) 2643-2758', '403.124.948-90', 'Rua João Ferreira Viana'),
(310, NULL, 'Lara Daniela Antônia Moura', '(11) 2814-7894', '527.049.198-28', 'Rua Álvaro Ribeiro'),
(317, NULL, 'Oliver Giovanni Melo', '(14) 99683-0041', '375.654.318-85', 'Rua Almirante Cockrane'),
(333, NULL, 'Teresinha Nicole Viana', '(19) 99237-5848', '600.897.048-94', 'Praça Frei Damião'),
(344, NULL, 'Raquel Mirella Cecília Pinto', '(11) 98871-8375', '290.769.268-24', 'Rua Quinze de Novembro'),
(347, NULL, 'Sérgio Luís de Paula', '(16) 99639-2585', '725.822.008-91', 'Rua Benedito Cardoso'),
(349, NULL, 'Bernardo Nathan da Paz', '(19) 99592-2365', '644.730.588-91', 'Rua Jarbas Nielsen Bastos'),
(356, NULL, 'Patrícia Adriana Assis', '(11) 98721-9260', '628.925.548-70', 'Rua Benito Saez Garcia'),
(363, NULL, 'Liz Cristiane Barros', '(17) 99272-8500', '455.330.638-70', 'Rua Ceará'),
(429, NULL, 'Yuri Enrico Campos', '(15) 3937-6349', '219.021.078-02', 'Rua Antônio Luís Barreiros'),
(432, NULL, 'Calebe Francisco Corte Real', '(11) 99345-7898', '611.705.998-18', 'Rua João do Couto'),
(441, NULL, 'Nathan Vicente Rocha', '(12) 98651-7335', '727.112.748-88', 'Rua Pedro Rachid'),
(514, NULL, 'Heloise Maria Liz Galvão', '(16) 99525-9806', '025.773.678-64', 'Travessa Henrique Maine'),
(525, NULL, 'Andreia Emilly Gonçalves', '(11) 98786-6440', '814.728.368-71', 'Rua Walter Franco de Lima'),
(530, NULL, 'Marcelo Heitor Jorge da Luz', '(11) 98682-0035', '825.464.858-14', 'Rua José Calau'),
(532, NULL, 'Roberto Cláudio Silveira', '(11) 3912-2500', '562.982.578-02', 'Rua Flórida 1758'),
(533, NULL, 'Rosângela Esther Bruna Figueiredo', '(19) 98874-3730', '260.647.258-69', 'Rua Belmiro Pacífico D Orasio'),
(538, NULL, 'Paulo Juan Sebastião Porto', '(15) 98991-3300', '929.538.938-73', 'Rua Geraldo Bento dos Santos'),
(548, NULL, 'Vinicius Benício de Paula', '(11) 98861-1664', '489.173.078-17', 'Rua Olivia Baptistella Rossetti'),
(640, NULL, 'Mariana Andreia dos Santos', '(11) 99551-1036', '130.606.438-49', 'Estrada Presidente João Goulart'),
(643, NULL, 'Iago Pietro Carlos Eduardo Carvalho', '(12) 98449-5434', '636.869.848-90', 'Praça Padre Jacob Stênico'),
(649, NULL, 'Aurora Luciana Esther da Mota', '(12) 98463-2300', '097.177.888-47', 'Rua Luís de Almeida Carvalho'),
(652, NULL, 'Renata Bruna Aurora da Cruz', '(19) 99315-8888', '870.467.228-38', 'Rua Celso José Abdalla Sayeg'),
(731, NULL, 'Victor Lucas Thiago Nogueira', '(16) 3704-2763', '146.876.378-41', 'Caminho das Tartarugas'),
(846, NULL, 'Bruna Tereza Fabiana Porto', '(11) 98309-5754', '768.903.778-00', 'Rua Santa Cruz de La Sierra'),
(944, NULL, 'Isis Bianca Aragão', '(14) 98787-0995', '889.808.268-18', 'Rua Romualdo Tavares da Silva');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_fornecedores`
--

DROP TABLE IF EXISTS `tb_fornecedores`;
CREATE TABLE `tb_fornecedores` (
  `id_fornecedor` int(11) NOT NULL,
  `nome` varchar(55) DEFAULT NULL,
  `contato` varchar(45) NOT NULL,
  `cnpj` varchar(45) NOT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `site` varchar(245) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_fornecedores`
--

INSERT INTO `tb_fornecedores` (`id_fornecedor`, `nome`, `contato`, `cnpj`, `cidade`, `site`, `estado`) VALUES
(1, 'Isis restaurante ME', '(12) 3955-0776', '00.448.819/0001-16', 'Campinas', 'www.isisehenriquerestauranteme.com.br', 'SP'),
(2, 'Raule João locações de automóveis Ltda', '(11) 2850-0124', '92.884.767/0001-49', 'Botucatu', 'www.raulejoaoadegaltda.com.br', 'SP'),
(3, 'Brenda e Agatha comércio de bebidas ME', '(11) 2542-1018', '95.947.225/0001-66', 'Araraquara', 'www.brendaeagathapaesedocesltda.com.br', 'SP'),
(4, 'Leticia e Bryantelasme corretores associados ME', '(19) 3711-0700', '52.899.444/0001-04', 'Araras', 'www.leticiaebryantelasme.com.br', 'SP'),
(5, 'Luís e Josefa telecomunicações', '(18) 3859-5559', '45.896.769/0001-78', 'São Paulo', 'www.fabioejosefatelecomunicacoesme.com.br', 'SP'),
(6, 'Lívia e Natália lavanderia ME', '(16) 2952-3362', '25.176.033/0001-18', 'Indaiatuba', 'www.liviaenataliapaesedocesltda.com.br', 'SP'),
(7, 'Claúdio e Lavínia marcenaria ME', '(11) 2939-1349', '75.048.836/0001-65', 'São José dos Campos', 'www.claudioelaviniamarcenarialtda.com.br', 'SP'),
(8, 'Joana e Emily contabill Ltda', '(12) 3601-3881', '29.715.881/0001-09', 'São Paulo', 'www.juaneemillycontabilltda.com.br', 'SP'),
(9, 'Pietra e Flávia acessoria judicial ME', '(11) 3744-7139', '81.486.455/0001-60', 'Campinas', 'www.pietraeflaviaassessoriajuridicaltda.com.br', 'SP'),
(10, 'Márcia e Caio eletrônica ME', '(11) 3817-8070', '38.540.310/0001-71', 'Limeira', 'www.marciaecaioeletronicaltda.com.br', 'SP'),
(11, 'Manuela e Nicole casa noturna ME', '(11) 2928-9003', '81.019.011/0001-15', 'Mogi das Cruzes', 'www.manuelaenicolecasanoturname.com.br', 'SP'),
(12, 'Emily e Benjamin entregas Ltda', '(11) 3927-5453', '89.682.563/0001-10', 'Marília', 'www.emilyebenjaminentregasexpressasltda.com.br', 'SP'),
(13, 'Cláudio e João ferragens Ltda', '(11) 3880-8760', '43.064.506/0001-77', 'Bauru', 'www.claudioejoaoferragensme.com.br', 'SP'),
(14, 'Isaac e Jorge telas Ltda', '(11) 2560-0388', '46.736.032/0001-50', 'Ribeirão Preto', 'www.isaacejorgetelasme.com.br', 'SP'),
(15, 'Daniel e Sebastião informáticas Ltda ', '(18) 3875-7934', '08.874.112/0001-83', 'Jacareí', 'www.danielaesebastiaoinformaticaltda.com.br', 'SP'),
(16, 'Bernardo e Ayla pizzaria me', '(19) 3568-9506', '43.943.218/0001-92', 'Valinhos', 'www.bernardoeaylapizzariadeliveryme.com.br', 'SP'),
(17, 'Roberto e Thiago pães e doces Me', '(11) 3623-6892', '16.209.217/0001-46', 'Jacareí', 'www.robertoethiagopaesedocesme.com.br', 'SP'),
(18, 'Larissa e Arthur lavanderia Ltda', '(11) 3720-1767', '62.761.109/0001-07', 'Cajamar', 'www.larissaearthurlavanderialtda.com.br', 'SP'),
(19, 'Pietra e Carlos Eduardo entulhos Ltda', '(11) 3618-4349', '82.728.696/0001-31', 'Itapeva', 'www.pietraecarloseduardoentulhosltda.com.br', 'SP'),
(20, 'Caue e Fábio fotografias Ltda', '(11) 2911-3454', '47.939.537/0001-85', 'Jales', 'www.caueefabiofotografiasltda.com.br', 'SP'),
(21, 'Antonella e Giovanna esportes Me', '(11) 3551-8414', '62.689.611/0001-46', 'Jundiaí', 'www.antonellaegiovannaesportesme.com.br', 'SP'),
(22, 'Tiago e Bruna construções Ltda', '(11) 2973-6074', '34.466.410/0001-44', 'Salto', 'www.tiagoebrunaconstrucoesltda.com.br', 'SP'),
(23, 'Giovanni e João pães e doces Ltda ', '(14) 2779-4672', '98.975.612/0001-02', 'Itapira', 'www.giovanniejoaopaesedocesltda.com.br', 'SP'),
(24, 'Elisa e Lucia financeira me ', '(11) 2503-0039', '93.532.068/0001-00', 'Guarulhos', 'www.elisaeluciafinanceirame.com.br', 'SP'),
(25, 'Nicolas e Ayla construções Ltda', '(11) 3547-0334', '78.341.778/0001-51', 'Ferraz de Vasconcelos', 'www.nicolaseaylaconstrucoesltda.com.br', 'SP'),
(26, 'Empresa1', '(12) 3955-0776', '00.448.819/0001-16', 'Campinas', 'www.isisehenriquerestauranteme.com.br', 'SP'),
(27, 'Empresa2', '(11) 2850-0124', '92.884.767/0001-49', 'Botucatu', 'www.raulejoaoadegaltda.com.br', 'SP'),
(28, 'Empresa3', '(11) 2542-1018', '95.947.225/0001-66', 'Araraquara', 'www.brendaeagathapaesedocesltda.com.br', 'SP'),
(29, 'Empresa4', '(19) 3711-0700', '52.899.444/0001-04', 'Araras', 'www.leticiaebryantelasme.com.br', 'SP'),
(30, 'Empresa5', '(18) 3859-5559', '45.896.769/0001-78', 'São Paulo', 'www.fabioejosefatelecomunicacoesme.com.br', 'SP'),
(31, 'Empresa6', '(16) 2952-3362', '25.176.033/0001-18', 'Indaiatuba', 'www.liviaenataliapaesedocesltda.com.br', 'SP'),
(32, 'Empresa7', '(11) 2939-1349', '75.048.836/0001-65', 'São José dos Campos', 'www.claudioelaviniamarcenarialtda.com.br', 'SP'),
(33, 'Empresa8', '(12) 3601-3881', '29.715.881/0001-09', 'São Paulo', 'www.juaneemillycontabilltda.com.br', 'SP'),
(34, 'Empresa9', '(11) 3744-7139', '81.486.455/0001-60', 'Campinas', 'www.pietraeflaviaassessoriajuridicaltda.com.br', 'SP'),
(35, 'Empresa10', '(11) 3817-8070', '38.540.310/0001-71', 'Limeira', 'www.marciaecaioeletronicaltda.com.br', 'SP'),
(36, 'Empresa11', '(11) 2928-9003', '81.019.011/0001-15', 'Mogi das Cruzes', 'www.manuelaenicolecasanoturname.com.br', 'SP'),
(37, 'Empresa12', '(11) 3927-5453', '89.682.563/0001-10', 'Marília', 'www.emilyebenjaminentregasexpressasltda.com.br', 'SP'),
(38, 'Empresa13', '(11) 3880-8760', '43.064.506/0001-77', 'Bauru', 'www.claudioejoaoferragensme.com.br', 'SP'),
(39, 'Empresa14', '(11) 2560-0388', '46.736.032/0001-50', 'Ribeirão Preto', 'www.isaacejorgetelasme.com.br', 'SP'),
(40, 'Empresa15', '(18) 3875-7934', '08.874.112/0001-83', 'Jacareí', 'www.danielaesebastiaoinformaticaltda.com.br', 'SP'),
(41, 'Empresa16', '(19) 3568-9506', '43.943.218/0001-92', 'Valinhos', 'www.bernardoeaylapizzariadeliveryme.com.br', 'SP'),
(42, 'Empresa17', '(11) 3623-6892', '16.209.217/0001-46', 'Jacareí', 'www.robertoethiagopaesedocesme.com.br', 'SP'),
(43, 'Empresa18', '(11) 3720-1767', '62.761.109/0001-07', 'Cajamar', 'www.larissaearthurlavanderialtda.com.br', 'SP'),
(44, 'Empresa19', '(11) 3618-4349', '82.728.696/0001-31', 'Itapeva', 'www.pietraecarloseduardoentulhosltda.com.br', 'SP'),
(45, 'Empresa20', '(11) 2911-3454', '47.939.537/0001-85', 'Jales', 'www.caueefabiofotografiasltda.com.br', 'SP'),
(46, 'Empresa21', '(11) 3551-8414', '62.689.611/0001-46', 'Jundiaí', 'www.antonellaegiovannaesportesme.com.br', 'SP'),
(47, 'Empresa22', '(11) 2973-6074', '34.466.410/0001-44', 'Salto', 'www.tiagoebrunaconstrucoesltda.com.br', 'SP'),
(48, 'Empresa23', '(14) 2779-4672', '98.975.612/0001-02', 'Itapira', 'www.giovanniejoaopaesedocesltda.com.br', 'SP'),
(49, 'Empresa24', '(11) 2503-0039', '93.532.068/0001-00', 'Guarulhos', 'www.elisaeluciafinanceirame.com.br', 'SP'),
(50, 'Empresa25', '(11) 3547-0334', '78.341.778/0001-51', 'Ferraz de Vasconcelos', 'www.nicolaseaylaconstrucoesltda.com.br', 'SP'),
(150, 'Stephanie e Richard Go On ', '(41) 92892-3879', '63.823.251/0001-96', 'Colombo', 'www.GoONrichard&stephanie.com.br ', 'SP'),
(151, 'Daniela e César Python Wu ', '(61) 92269-4519', '00.284.074/0001-05', 'Brasília', 'www.PythonWu.com.br ', 'SP'),
(234, 'Jasmyn e Adam Cooperativa Ter ', '(11) 94057-7234', '31.617.072/0001-06', 'Suzano ', 'www.Jasmyn&AdamCooperativaTer.com.br ', 'SP'),
(238, 'Emília e Rania Logística Pe', '(41) 98034-3617 ', ' 45.844.523/0001-52', 'Rio Negro ', 'www.LogistcaPeEmilia&Rania.com.br', 'SP'),
(247, 'Lorenzo e Ticiana Octano', '(77) 98871-3807', '45.508.247/0001-51', 'Rio do Antonio', 'www.OctanoTl.com.br ', 'SP'),
(291, 'Ivy e Noé Individual L ', '(41) 98544-6605', '17.273.430/0001-80', 'Curitiba  ', 'www.IndividualLByIvyandNoe.com.br', 'SP'),
(315, 'Abdullah e Stacy Trilha joy', '(41) 9356-8925', '62.506.116/0001-54', 'Curitiba', 'www.TheTrilhaJoy.com.br ', 'SP'),
(319, 'Teresa e Omar Vita Alp', '(77) 98551-2182', '64.517.282/0001-81', 'Paratinga', 'www.VitaAlpOT.com.br ', 'SP'),
(320, 'Christian e Alisa ClearChoice ', '(84) 91065-4823', '52.738.616/0001-68', 'Bom Jesus', 'www.ClearChoice.com.br', 'SP'),
(321, 'Bela e Miguela T Desenvolvimento ', '(43) 96024-2146', '66.098.086/0001-45', 'Londrina ', 'www.TDesenvolvimentoBM.com.br', 'SP'),
(327, 'Maitê e Kendra Slim Tam', '(49) 96689-5696', '61.752.898/0001-49', 'Planalto Alegre', 'www.Slimtam.com.br ', 'SP'),
(336, 'Leo e Theo  Patriots Tam ', '(14) 98215-9139', '97.433.492/0001-40', 'Arco-Iris', 'www.PatriotsTAM.com.br ', 'SP'),
(343, 'Sheila e Alessia NorthPoint', '(41) 92248-4692', '69.469.371/0001-13', 'Curitiba', 'www.NorthPointBysheila/alessia.com.br ', 'SP'),
(344, 'Yuri e Lana Captura Vil ', '(41) 93095-7693', '62.835.170/0001-43', 'Piraquara', 'www.VilCaptura.com.br ', 'SP'),
(348, 'Sarah e Alícia U Zone ', '(66) 91198-1399 ', '97.961.817/0001-68', 'Campo Verde', 'www.Uzone.com.br ', 'SP'),
(349, 'Miranda e Damien Paragon Vip', '(65) 93272-3002', '77.301.569/0001-11', 'Rio Branco', 'www.ParagonVip.com.br ', 'SP'),
(358, 'Abel e Ashley Oversea Team', '(84) 97096-3743 ', '76.641.399/0001-51', 'Espírito Santo  ', 'www.OverseaTeam.com.br ', 'SP'),
(406, 'Tabita e Isadora Alt Pesquisa', '(64) 95006-2692', '18.934.790/0001-48', 'Panamá', ' www.AltPesquisa.com.br ', 'SP'),
(431, 'Luz e Raphael  StepByStep', '(77) 95038-3625', '64.411.031/0001-18', 'Belo Campo', 'www.StepByStep.com.br', 'SP'),
(441, 'Olívia e Antoine Sustentável pla', '(61) 99029-1714', '83.116.841/0001-96', 'Brasília', 'www.SustentávélPla.com.br ', 'SP'),
(453, 'Manuel e Geovanna Clássico Opa', '(11) 90301-5455', '12.701.420/0001-84', 'Guarulhos', 'www.ClássicoOpa.com.br ', 'SP'),
(462, 'Riyan e Gabriel Yay Vale', '(41) 95741-2946', '98.330.470/0001-18', 'Pinhais', ' www.ValeYay.com.br ', 'SP'),
(527, 'Rafael e Kleyton Pe Garagem', '(64) 97543-8874', '67.279.633/0001-51', 'Goiânia', '   www.PeGaragemRK.com.br ', 'SP'),
(547, 'Rosa e Max Dale Brite', '(41) 98640-7381', '04.996.920/0001-62', 'Pontal do Paraná', 'www.DaleBrite.com.br  ', 'SP'),
(552, 'Asael e Frederico Verity Uy', '(49) 93271-8951', ' 35.285.351/0001-70', 'Bom Jesus', 'www.VerityYU.com.br ', 'SP'),
(563, 'Juan e Luis Eletrônico Vil', '(41) 97984-7230', '79.372.481/0001-16', 'São José dos Pinhais', 'www.VilEletrico.com.br ', 'SP'),
(626, 'Heloisa e Nelson ferragens Ltda', '(11) 3956-5742', '47.166.848/0001-59', 'Cubatão', 'www.heloisaenelsonferragensltda.com.br', 'SP'),
(646, 'Emídio e Abigail Protótipo Up ', '(12) 92646-3527', '69.156.909/0001-30', 'Taubate', ' www.ProtótipoUp.com.br ', 'SP'),
(755, 'Eduardo e Raúl Colaborativo Opa', ' (11) 96749-4197', '66.812.738/0001-61', 'Itatiba', 'www.ColaborativoOpaRe.com.br ', 'SP'),
(845, 'Jandira e Felipe Sobre Ltda', '(43) 98840-8480', '23.297.998/0001-06', 'Jacarezinho', 'www.SobreLtda.com.br ', 'SP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_frequencia`
--

DROP TABLE IF EXISTS `tb_frequencia`;
CREATE TABLE `tb_frequencia` (
  `registro_funcionario` int(5) NOT NULL,
  `atrasos` varchar(45) DEFAULT NULL,
  `faltas` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_frequencia`
--

INSERT INTO `tb_frequencia` (`registro_funcionario`, `atrasos`, `faltas`) VALUES
(1, '0 horas', 3),
(32, '1 hora', 1),
(33, '0 horas', 3),
(34, '0 horas', 5),
(35, '0 horas', 4),
(36, '1 hora', 3),
(37, '0 horas', 0),
(38, '0 horas', 4),
(39, '2 horas', 2),
(40, '0 horas', 6),
(41, '0 horas', 1),
(42, '0 horas', 0),
(43, '1 hora', 1),
(44, '0 hora', 2),
(45, '2 horas', 3),
(46, '0 horas', 0),
(47, '0 horas', 0),
(48, '0 horas', 0),
(49, '1 hora', 0),
(50, '0 horas', 0),
(51, '2 horas', 0),
(52, '0 horas', 5),
(53, '0 horas', 2),
(54, '1 hora', 6),
(55, '0 horas', 0),
(56, '0 horas', 3),
(267, '0 horas', 3),
(268, '0 horas', 3),
(269, '0 horas', 3),
(270, '1 hora', 3),
(271, '1 hora', 4),
(272, '1 hora', 4),
(273, '1 hora', 4),
(274, '1 hora', 4),
(275, '2 horas', 4),
(276, '2 horas', 2),
(277, '2 horas', 2),
(278, '2 horas', 2),
(279, '2 horas', 2),
(280, '0 horas', 2),
(281, '0 horas', 0),
(282, '0 horas', 0),
(283, '0 horas', 0),
(284, '0 horas', 0),
(285, '3 horas', 0),
(286, '3 horas', 0),
(287, '3 horas', 0),
(288, '3 horas', 1),
(289, '3 horas', 1),
(290, '1 hora', 1),
(291, '1 hora', 1),
(292, '1 hora', 1),
(293, '4 horas', 2),
(294, '4 horas', 2),
(295, '4 horas', 3),
(296, '4 horas', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_funcionarios`
--

DROP TABLE IF EXISTS `tb_funcionarios`;
CREATE TABLE `tb_funcionarios` (
  `id_funcionario` int(8) NOT NULL,
  `salario` varchar(55) DEFAULT NULL,
  `ferias` varchar(45) DEFAULT NULL,
  `cpf` varchar(25) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `contato` varchar(25) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_funcionarios`
--

INSERT INTO `tb_funcionarios` (`id_funcionario`, `salario`, `ferias`, `cpf`, `nome`, `contato`, `endereco`) VALUES
(1, 'R$2.000,00', '168 horas', '728.485.320-41', 'Murilo Geraldo Diogo da Cruz', NULL, 'Quadra 1206 Sul Alameda 22'),
(2, 'R$4.000,00', '168 horas', '925.837.170-49', 'Pedro Henrique Roberto Osvaldo', NULL, '3ª Travessa das Palmeiras'),
(3, 'R$3.000,00', '168 horas', '941.760.040-02', 'Fábio Heitor Campos', NULL, 'Rua Passos'),
(4, 'R$2.500,00', '168 horas', '908.164.590-02', 'Iago Leonardo Ruan Aragão', NULL, 'Rua Doutor Antônio Olímpio'),
(5, 'R$3.600,00', '168 horas', '967.326.890-88', 'Matheus Severino Gomes', NULL, 'Praça Armindo Bassetti'),
(6, 'R$7.000,00', '168 horas', '350.904.460-67', 'Cauã Kevin Davi Santos', NULL, 'Rua Abacateiro'),
(7, 'R$5.000,00', '168 horas', '560.928.220-91', 'Cláudio Francisco Henry da Rosa', NULL, 'Travessa São Francisco'),
(8, 'R$1.500,00', '168 horas', '886.068.530-38', 'Andreia Cristiane Aurora da Luz', NULL, 'Quadra QNL 7 Conjunto C'),
(9, 'R$2.000,00', '168 horas', '633.929.290-93', 'Renato Henrique Cardoso', NULL, 'Rua Massaranduba'),
(10, 'R$3.400,00', '168 horas', '318.327.580-52', 'Aline Milena Josefa da Rocha', NULL, 'Rua Barcelona'),
(11, 'R$8.000,00', '168 horas', '483.232.230-33', 'Raul Leandro Melo', NULL, 'Beco Nicolau da Cruz'),
(12, 'R$2.300,00', '168 horas', '997.934.710-42', 'Manuel Lorenzo Ryan Pereira', NULL, 'Quadra S4'),
(13, 'R$3.700,00', '168 horas', '851.642.070-10', 'Joana Eduarda Rezende', NULL, 'Avenida Bento Brasil'),
(14, 'R$4.500,00', '168 horas', '606.812.210-70', 'Diego Julio João Alves', NULL, 'Rua Santa Catarina'),
(15, 'R$5.600,00', '168 horas', '774.783.550-72', 'Débora Juliana da Mata', NULL, 'Rua Yamaguti Kankit'),
(16, 'R$2.800,00', '168 horas', '923.337.530-72', 'Pedro Henrique Enzo ', NULL, 'Rua Severino Laurentino Leite'),
(17, 'R$10.000,00', '168 horas', '584.837.770-70', 'Amanda Jaqueline Natália Novaes', NULL, 'Rua Oriente Tenuta'),
(18, 'R$4.700,00', '168 horas', '581.500.440-51', 'Marcela Malu Alves', NULL, 'Rua Clarindo Chaves'),
(19, 'R$2.300,00', '168 horas', '885.098.890-74', 'Carlos Vitor da Silva', NULL, 'Rua Joaquim Jovino Martins'),
(20, 'R$1.500,00', '168 horas', '889.059.920-05', 'Antônia Kamilly Ribeiro', NULL, 'Rua Maria Justina Miranda'),
(21, 'R$5.400,00', '168 horas', '425.756.830-50', 'Olivia Giovanna Natália Santos', NULL, 'Rua Mestre Diogo'),
(22, 'R$6.000,00', '168 horas', '422.121.030-34', 'Vinicius Nicolas da Paz', NULL, 'Rua Castro Alves'),
(23, 'R$3.400,00', '168 horas', '031.379.030-25', 'Fábio Vicente Bento Melo', NULL, 'Rua Odilardo Silva'),
(24, 'R$4.300,00', '168 horas', '253.836.670-40', 'Kauê Cláudio Oliveira', NULL, 'Rua João Rosa Góes'),
(25, 'R$5.000,00', '168 horas', '862.989.610-89', 'Débora Lavínia Josefa da Mata', NULL, 'Rua Ozéas Martins Gomes'),
(26, '2000', '168 horas', '728.485.320-41', 'Murilo Geraldo Diogo da Cruz', NULL, 'Quadra 1206 Sul Alameda 22'),
(27, '4000', '168 horas', '925.837.170-49', 'Pedro Henrique Roberto Osvaldo', NULL, '3ª Travessa das Palmeiras'),
(28, '3000', '168 horas', '941.760.040-02', 'Fábio Heitor Campos', NULL, 'Rua Passos'),
(29, '2500', '168 horas', '908.164.590-02', 'Iago Leonardo Ruan Aragão', NULL, 'Rua Doutor Antônio Olímpio'),
(30, '3600', '168 horas', '967.326.890-88', 'Matheus Severino Gomes', NULL, 'Praça Armindo Bassetti'),
(31, '7000', '168 horas', '350.904.460-67', 'Cauã Kevin Davi Santos', NULL, 'Rua Abacateiro'),
(32, '5000', '168 horas', '560.928.220-91', 'Cláudio Francisco Henry da Rosa', NULL, 'Travessa São Francisco'),
(33, '1500', '168 horas', '886.068.530-38', 'Andreia Cristiane Aurora da Luz', NULL, 'Quadra QNL 7 Conjunto C'),
(34, '2000', '168 horas', '633.929.290-93', 'Renato Henrique Cardoso', NULL, 'Rua Massaranduba'),
(35, '3400', '168 horas', '318.327.580-52', 'Aline Milena Josefa da Rocha', NULL, 'Rua Barcelona'),
(36, '8000', '168 horas', '483.232.230-33', 'Raul Leandro Melo', NULL, 'Beco Nicolau da Cruz'),
(37, '2300', '168 horas', '997.934.710-42', 'Manuel Lorenzo Ryan Pereira', NULL, 'Quadra S4'),
(38, '3700', '168 horas', '851.642.070-10', 'Joana Eduarda Rezende', NULL, 'Avenida Bento Brasil'),
(39, '4500', '168 horas', '606.812.210-70', 'Diego Julio João Alves', NULL, 'Rua Santa Catarina'),
(40, '5600', '168 horas', '774.783.550-72', 'Débora Juliana da Mata', NULL, 'Rua Yamaguti Kankit'),
(41, '2800', '168 horas', '923.337.530-72', 'Pedro Henrique Enzo ', NULL, 'Rua Severino Laurentino Leite'),
(42, '10000', '168 horas', '584.837.770-70', 'Amanda Jaqueline Natália Novaes', NULL, 'Rua Oriente Tenuta'),
(43, '4700', '168 horas', '581.500.440-51', 'Marcela Malu Alves', NULL, 'Rua Clarindo Chaves'),
(44, '2300', '168 horas', '885.098.890-74', 'Carlos Vitor da Silva', NULL, 'Rua Joaquim Jovino Martins'),
(45, '1500', '168 horas', '889.059.920-05', 'Antônia Kamilly Ribeiro', NULL, 'Rua Maria Justina Miranda'),
(46, '5400', '168 horas', '425.756.830-50', 'Olivia Giovanna Natália Santos', NULL, 'Rua Mestre Diogo'),
(47, '6000', '168 horas', '422.121.030-34', 'Vinicius Nicolas da Paz', NULL, 'Rua Castro Alves'),
(48, '3400', '168 horas', '031.379.030-25', 'Fábio Vicente Bento Melo', NULL, 'Rua Odilardo Silva'),
(49, '4300', '168 horas', '253.836.670-40', 'Kauê Cláudio Oliveira', NULL, 'Rua João Rosa Góes'),
(50, '5000', '168 horas', '862.989.610-89', 'Débora Lavínia Josefa da Mata', NULL, 'Rua Ozéas Martins Gomes'),
(81, 'R$5.900,00', '168 horas', '243.549.200-69', 'Bruna Betina Camila Almeida', '', 'Rua Nazira Moisés'),
(82, 'R$7.420,00', '168 horas', '459.212.990-30', 'Lorenzo Antonio de Paula', '', 'Rua Ageu Linhares'),
(83, 'R$8.900,00', '168 horas', '650.321.020-59', 'Calebe Benjamin Moraes', '', 'Rua dos Catiribais'),
(84, 'R$6.500,00', '168 horas', '726.560.400-86', 'Tânia Laura Barbosa', '', 'Rua Borges Lagoa 1231'),
(85, 'R$3.700,00', '168 horas', '417.879.120-60', 'Augusto Rafael Bento Mendes', '', 'Rua do Borges, s/n'),
(86, 'R$4.800,00', '168 horas', '497.947.490-01', 'Agatha Luiza Almeida', '', 'Rua Neves'),
(87, 'R$8.500,00', '168 horas', '078.644.930-68', 'Bruno Danilo Rodrigo Caldeira', '', 'Rua Pascoal Moreira Leme'),
(88, 'R$7.900,00', '168 horas', '656.891.770-24', 'Benedito André Giovanni Assunção', '', 'Praça da Alvorada'),
(89, 'R$4.600,00', '168 horas', '846.281.620-34', 'Sara Elisa Pires', '', 'Rua Seis'),
(90, 'R$5.900,00', '168 horas', '788.160.240-62', 'Marcela Regina Almada', '', 'Rua Andradina'),
(91, 'R$1.900,00', '168 horas', '615.493.270-70', 'Ian Erick Castro', '', 'Rua Mururé'),
(92, 'R$2.800,00', '168 horas', '937.957.810-51', 'Tomás Igor Leandro Peixoto', '', 'Rua Lígia Fagundes Teles'),
(93, 'R$8.600,00', '168 horas', '506.369.960-00', 'Isis Sarah Freitas', '', 'Avenida Leopardos'),
(94, 'R$4.200,00', '168 horas', '062.345.020-83', 'Renata Emilly Larissa da Cunha', '', 'Avenida A'),
(95, 'R$6.100,00', '168 horas', '133.954.570-52', 'Vanessa Marlene Vieira', '', 'Rua Dermario Bonates'),
(96, 'R$3.900,00', '168 horas', '347.232.060-51', 'Daniel Carlos Osvaldo da Luz', '', 'Rua Elpídio Sacavem'),
(97, 'R$5.900,00', '168 horas', '254.889.110-06', 'Silvana Juliana Vieira', '', 'Rua Renê Bittencourt'),
(98, 'R$3.900,00', '168 horas', '334.247.470-09', 'Ryan Filipe Melo', '', 'Fonte das Pedras'),
(99, 'R$1.900,00', '168 horas', '791.404.340-01', 'Cauã Vitor Paulo Castro', '', 'Avenida Getúlio Vargas 290'),
(100, 'R$7.900,00', '168 horas', '021.632.560-90', 'Bryan Tiago André da Silva', '', 'Avenida Josias de Freitas'),
(101, 'R$4.900,00', '168 horas', '648.054.770-59', 'Priscila Luiza Raquel Figueiredo', '', 'Rua Tietê'),
(102, 'R$6.900,00', '168 horas', '739.179.710-38', 'Pedro Caio Mário Duarte', '', 'Rua Fênix'),
(103, 'R$3.900,00', '168 horas', '733.649.950-36', 'Nathan Benedito Manuel Caldeira', '', 'Rua Projetada 04'),
(104, 'R$8.900,00', '168 horas', '336.864.870-55', 'Thomas Eduardo Anderson Viana', '', 'Rua da Glória'),
(105, 'R$5.400,00', '168 horas', '410.446.570-49', 'Giovana Kamilly Duarte', '', 'Rua Joaquim Ribeiro Peres'),
(106, 'R$2.900,00', '168 horas', '799.523.400-79', 'Raul Osvaldo Ribeiro', '', 'Rua 7 de Setembro'),
(107, 'R$7.900,00', '168 horas', '819.113.140-41', 'Sabrina Valentina Mendes', '', 'Rua 68'),
(108, 'R$9.300,00', '168 horas', '537.935.410-61', 'Nicolas Giovanni Mendes', '', '2ª Travessa da Faveira'),
(109, 'R$7.200,00', '168 horas', '660.019.110-45', 'Rayssa Eduarda Evelyn Aparício', '', 'Rua Jornalista Ney Ramalho'),
(110, 'R$4.900,00', '168 horas', '223.636.700-78', 'Márcio Igor Sales', '', 'Rua das Acácias');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_historico_preco_prod`
--

DROP TABLE IF EXISTS `tb_historico_preco_prod`;
CREATE TABLE `tb_historico_preco_prod` (
  `cod_hist` int(11) NOT NULL,
  `datatime` date DEFAULT NULL,
  `valor_anterior` float(6,2) DEFAULT NULL,
  `valor_novo` float(6,2) DEFAULT NULL,
  `cod_produto` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_marcas`
--

DROP TABLE IF EXISTS `tb_marcas`;
CREATE TABLE `tb_marcas` (
  `id_marca` int(8) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_marcas`
--

INSERT INTO `tb_marcas` (`id_marca`, `nome`) VALUES
(1, ''),
(2, ''),
(3, ''),
(4, ''),
(5, ''),
(6, ''),
(7, ''),
(8, ''),
(9, ''),
(10, ''),
(11, ''),
(12, ''),
(13, ''),
(14, ''),
(15, ''),
(16, ''),
(17, ''),
(18, ''),
(19, ''),
(20, ''),
(21, ''),
(22, ''),
(23, ''),
(24, ''),
(25, ''),
(26, 'Citroen'),
(27, 'Fiat'),
(28, 'Ford'),
(29, 'Honda'),
(30, 'Jeep'),
(31, 'Mitsubishi'),
(32, 'Toyota'),
(33, 'Tesla'),
(34, 'Volkswagen'),
(35, 'Porsche'),
(36, 'Mini'),
(37, 'Mercedes-Benz'),
(38, 'Kia'),
(39, 'Bmw'),
(40, 'Audi'),
(41, 'Abarth'),
(42, 'Alfa Romeo'),
(43, 'Alpine'),
(44, 'Bentley'),
(45, 'Cupra'),
(46, 'Dacia'),
(47, 'Ds'),
(48, 'Ferraria'),
(49, 'Jaguar'),
(50, 'Land Rover'),
(51, 'Lamborguini'),
(52, 'Bentley Mulsanne'),
(53, 'BMW Série 1'),
(54, 'BMW Série 2'),
(55, 'BMW Série 3'),
(56, 'BMW Série 4'),
(57, 'BMW Série 5'),
(58, 'BMW Série 6'),
(59, 'BMW Série 7'),
(60, 'BMW Série i'),
(61, 'Bugatti Type 13'),
(62, 'Bugatti Type 101'),
(63, 'Bugatti EB110'),
(64, 'Bugatti EB112'),
(65, 'Bugatti EB118'),
(66, 'Bugatti Veyron'),
(67, 'Bugatti Chiron'),
(68, 'Bugatti Chiron Super Sport'),
(69, 'Bugatti Divo'),
(70, 'Bugatti La Voiture Noir'),
(71, 'Bugatti Centodieci'),
(72, 'Buick Cascada'),
(73, 'Buick Centurion'),
(74, 'Buick Enclave'),
(75, 'Buick Encore'),
(76, 'Buick Envision'),
(77, 'Buick Excelle'),
(78, 'Buick LaCrosse'),
(79, 'Buick LeSabre'),
(80, 'Buick Lucerne');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_modelos_novos`
--

DROP TABLE IF EXISTS `tb_modelos_novos`;
CREATE TABLE `tb_modelos_novos` (
  `idmodelo_novo` int(11) NOT NULL,
  `cor` varchar(45) DEFAULT NULL,
  `ano` int(4) NOT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `id_marca` int(8) NOT NULL,
  `cambio` varchar(45) DEFAULT NULL,
  `combustivel` varchar(45) DEFAULT NULL,
  `preco` varchar(45) NOT NULL,
  `garantia` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_modelos_novos`
--

INSERT INTO `tb_modelos_novos` (`idmodelo_novo`, `cor`, `ano`, `categoria`, `id_marca`, `cambio`, `combustivel`, `preco`, `garantia`, `nome`) VALUES
(51, 'Preto', 2015, 'Hatch', 26, 'Câmbio Manual', 'Gasolina comum', 'R$163.984,00', '60 dias', 'Gol'),
(76, 'Azul', 2016, 'Sedan', 27, 'Câmbio Automático', 'Diesel aditivado', 'R$618.880,00', '60 dias', 'Uno'),
(100, 'Vermelho', 2014, 'Picape', 28, 'CVT', 'Gasolina aditivada', 'R$703.916,00', '60 dias', 'Palio'),
(101, 'Amarelo', 2018, 'SUV', 29, 'CVT', 'Diesel aditivado', 'R$836.549,00', '90 dias', 'Fox'),
(102, 'Azul turquesa', 2019, 'Aventureiro compacto', 30, 'Câmbio Automático', 'Diesel aditivado', 'R$958.553,00', '90 dias', 'Siena'),
(103, 'Alizarina', 2017, 'Hatch subcompacto', 31, 'Câmbio Manual', 'GNV', 'R$858.963,00', '120 dias', 'Celta'),
(104, 'Amarelo brasilis', 2016, 'Hatch compacto', 32, 'Câmbio Manual', 'Etanol aditivado', 'R$110.092,00', '120 dias', 'Voyage'),
(105, 'Amarelo creme', 2019, 'Hatch médio', 33, 'CVT', 'Diesel premium', 'R$631.958,00', '120 dias', 'HB20'),
(106, 'Aspargo', 2018, 'Van grande', 34, 'Câmbio Automático', 'Diesel premium', 'R$566.400,00', '90 dias', 'Corsa Sedan'),
(107, 'Amarelo esverdeado', 2021, 'Esportivo médio', 35, 'Câmbio Automático', 'Etanol', 'R$23.647,00', '90 dias', 'Onix'),
(108, 'Bege', 2016, 'Esportivo compacto', 36, 'Câmbio Automático', 'Diesel S-10', 'R$251.300,00', '90 dias', 'Sandero'),
(109, 'Branco fantasma', 2015, 'SUV grande', 37, 'CVT', 'Diesel S-10', 'R$832.915,00', '60 dias', 'Fiesta'),
(110, 'Caramelho', 2014, 'SUV compacto', 38, 'Câmbio Manual', 'Gasolina premium', 'R$242.887,00', '60 dias', 'Cobalt'),
(111, 'Carmesim', 2017, 'Familiar grande', 39, 'Câmbio Manual', 'Diesel S-10', 'R$393.500,00', '60 dias', 'Ka'),
(112, 'Ciano', 2019, 'Picape compacta', 40, 'Câmbio Manual', 'GNV', 'R$907.427,00', '60 dias', 'Corolla'),
(113, 'Cereja', 2018, 'Picape média', 41, 'Câmbio Manual', 'Diesel comum', 'R$955.033,00', '60 dias', 'Civic'),
(115, 'Cinza claro', 2016, 'Esportivo grande', 43, 'CVT', 'Gasolina comum', 'R$356.221,00', '90 dias', 'Punto'),
(116, 'Cinza escuro', 2013, 'Conversível compacto', 44, 'CVT', 'Etanol aditivado', 'R$822.520,00', '90 dias', 'Fit'),
(117, 'Creme de menta', 2014, 'Conversível médio', 45, 'CVT', 'Gasolina comum', 'R$921.763,00', '90 dias', 'Spin'),
(118, 'Dainise', 2017, 'Conversível grande', 46, 'Câmbio Automático', 'Gasolina comum', 'R$208.924,00', '90 dias', 'C3'),
(119, 'Dourado', 2018, 'Van média', 47, 'CVT', 'Eletricidade', 'R$574.804,00', '120 dias', 'Cruze Sedan'),
(120, 'Ébano', 2019, 'Jipe', 48, 'Câmbio Automático', 'GNV', 'R$814.698,00', '120 dias', 'Logan'),
(121, 'Dourado pálido', 2015, 'Furgão compacto', 49, 'Câmbio Manual', 'Diesel comum', 'R$706.562,00', '120 dias', 'Agile'),
(122, 'Escarlate', 2016, 'Furgão médio', 50, 'CVT', 'Eletricidade', 'R$546.285,00', '120 dias', 'City'),
(123, 'Esmeralda', 2013, 'Caminhão urbano', 34, 'Câmbio Automático', 'Eletricidade', 'R$63.019,00', '120 dias', 'Volkswagen Fusca'),
(124, 'Eucalipto', 2013, 'Jipe grande', 34, 'Câmbio Automático', 'Gasolina comum', 'R$347.187,00', '90 dias', 'Volkswagen Kombi	'),
(125, 'Fandango', 2013, 'Jipe médio', 34, 'Câmbio Automático', 'Gasolina comum', 'R$827.454,00', '90 dias', 'Rural Willys	'),
(126, 'Feldspato', 2013, 'Jipe compacto', 41, 'Câmbio Automático', 'Gasolina comum', 'R$82.283,00', '90 dias', 'Romi-Isetta 2	'),
(127, 'Flerte', 2013, 'Jipe subcompacto', 46, 'Câmbio Automático', 'Gasolina comum', 'R$357.219,00', '90 dias', 'DKW-Vemag Candango	'),
(128, 'Fuligem', 2014, 'SUV grande', 34, 'Câmbio Automático', 'Gasolina comum', 'R$805.701,00', '90 dias', 'Aero Willys	'),
(129, 'Fúchsia', 2014, 'SUV médio', 44, 'Câmbio Automático', 'Diesel aditivado', 'R$806.677,00', '120 dias', 'Simca Présidence	'),
(130, 'Grená', 2014, 'SUV compacto', 34, 'Câmbio Automático', 'Diesel aditivado', 'R$586.938,00', '120 dias', 'Willys Interlagos 4	'),
(131, 'Gainsboro', 2014, 'SUV subcompacto', 34, 'Câmbio Automático', 'Diesel aditivado', 'R$779.434,00', '120 dias', 'Volkswagen Karmann Ghia	'),
(132, 'Glitter', 2014, 'Cupê grande', 34, 'Câmbio Automático', 'Diesel aditivado', 'R$396.309,00', '120 dias', 'Democrata	'),
(133, 'Goiaba', 2015, 'Cupê médio', 41, 'Câmbio Automático', 'Diesel aditivado', 'R$387.906,00', '120 dias', 'Abarth 595'),
(134, 'Herbal', 2015, 'Cupê compacto', 41, 'Câmbio Manual', 'Eletricidade', 'R$217.143,00', '60 dias', 'Abarth 595 Turismo'),
(135, 'Heliotrópio', 2015, 'Cupê subcompacto', 41, 'Câmbio Manual', 'Eletricidade', 'R$551.619,00', '60 dias', 'Abarth 595 Pista'),
(136, 'Índigo', 2015, 'Crossover grande', 41, 'Câmbio Manual', 'Eletricidade', 'R$362.849,00', '60 dias', 'Abarth 595 Competizione'),
(137, 'Independência', 2015, 'Crossover médio', 41, 'Câmbio Manual', 'Eletricidade', 'R$554.980,00', '60 dias', 'Abarth 595 Esseesse'),
(138, 'Iris', 2016, 'Crossover compacto', 41, 'Câmbio Manual', 'Eletricidade', 'R$418.937,00', '60 dias', 'Abarth 595 Scorpioneoro'),
(139, 'Jade', 2016, 'Crossover subcompacto', 43, 'Câmbio Manual', 'GNV', 'R$316.674,00', '180 dias', 'Agrale Elefantré'),
(140, 'Jambo', 2016, 'Wagon grande', 43, 'Câmbio Manual', 'GNV', 'R$355.959,00', '180 dias', 'Agrale Marruá'),
(141, 'Jasmine', 2016, 'Wagon médio', 42, 'Câmbio Manual', 'GNV', 'R$338.083,00', '180 dias', 'Alfa Romeo 145'),
(142, 'Kiwi', 2016, 'Wagon compacto', 42, 'Câmbio Manual', 'GNV', 'R$576.340,00', '180 dias', 'Alfa Romeo 146'),
(143, 'Kobi', 2017, 'Wagon subcompacto', 42, 'Câmbio Manual', 'GNV', 'R$713.611,00', '180 dias', 'Alfa Romeo 147'),
(144, 'Kobicha', 2017, 'Conversível grande', 42, 'CVT', 'Diesel comum', 'R$9.158,00', '60 dias', 'Alfa Romeo 155'),
(145, 'Laranja', 2017, 'Conversível médio', 42, 'CVT', 'Diesel comum', 'R$471.641,00', '60 dias', 'Alfa Romeo 156'),
(146, 'Lavanda', 2017, 'Conversível compacto', 42, 'CVT', 'Diesel comum', 'R$855.118,00', '60 dias', 'Alfa Romeo 159'),
(147, 'Lilás', 2017, 'Conversível subcompacto', 42, 'CVT', 'Diesel comum', 'R$241.983,00', '60 dias', 'Alfa Romeo 164'),
(148, 'Lima', 2018, 'Luxo grande', 42, 'CVT', 'Diesel comum', 'R$632.194,00', '60 dias', 'Alfa Romeo 166'),
(149, 'Lemon', 2018, 'Luxo médio', 42, 'CVT', 'Gasolina premium', 'R$190.975,00', '120 dias', 'Alfa Romeo 2000 GTV'),
(150, 'Linho', 2018, 'Luxo compacto', 42, 'CVT', 'Gasolina premium', 'R$138.838,00', '120 dias', 'Alfa Romeo 2300'),
(151, 'Madeira', 2018, 'Luxo subcompacto', 42, 'CVT', 'Gasolina premium', 'R$241.339,00', '120 dias', 'Alfa Romeo Giulia'),
(152, 'Magenta', 2018, 'Híbrido ', 42, 'CVT', 'Gasolina premium', 'R$980.888,00', '120 dias', 'Alfa Romeo Spider');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_modelos_seminovos`
--

DROP TABLE IF EXISTS `tb_modelos_seminovos`;
CREATE TABLE `tb_modelos_seminovos` (
  `idmodelo_seminovo` int(11) NOT NULL,
  `cor` varchar(45) DEFAULT NULL,
  `ano` int(4) NOT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `id_marca` int(8) NOT NULL,
  `cambio` varchar(45) DEFAULT NULL,
  `combustivel` varchar(45) DEFAULT NULL,
  `preco` varchar(45) NOT NULL,
  `garantia` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_modelos_seminovos`
--

INSERT INTO `tb_modelos_seminovos` (`idmodelo_seminovo`, `cor`, `ano`, `categoria`, `id_marca`, `cambio`, `combustivel`, `preco`, `garantia`, `nome`) VALUES
(1, 'Preto', 2015, 'Hatch', 26, 'Câmbio Manual', 'Gasolina comum', 'R$163.984,00', '60 dias', 'March'),
(2, 'Azul', 2016, 'Sedan', 27, 'Câmbio Automático', 'Diesel aditivado', 'R$618.880,00', '60 dias', 'Fiesta Sedan'),
(3, 'Vermelho', 2014, 'Picape', 28, 'CVT', 'Gasolina aditivada', 'R$703.916,00', '60 dias', 'Space Fox'),
(4, 'Amarelo', 2018, 'SUV', 29, 'CVT', 'Diesel aditivado', 'R$836.549,00', '90 dias', 'Cruze HB'),
(5, 'Azul turquesa', 2019, 'Aventureiro compacto', 30, 'Câmbio Automático', 'Diesel aditivado', 'R$958.553,00', '90 dias', 'Focus'),
(6, 'Alizarina', 2017, 'Hatch subcompacto', 31, 'Câmbio Manual', 'GNV', 'R$858.963,00', '120 dias', '207'),
(7, 'Amarelo brasilis', 2016, 'Hatch compacto', 32, 'Câmbio Manual', 'Etanol aditivado', 'R$110.092,00', '120 dias', 'Versa'),
(8, 'Amarelo creme', 2019, 'Hatch médio', 33, 'CVT', 'Diesel premium', 'R$631.958,00', '120 dias', 'i30'),
(9, 'Aspargo', 2018, 'Van grande', 34, 'Câmbio Automático', 'Diesel premium', 'R$566.400,00', '90 dias', '308'),
(10, 'Amarelo esverdeado', 2021, 'Esportivo médio', 35, 'Câmbio Automático', 'Etanol', 'R$23.647,00', '90 dias', 'Etios HB'),
(11, 'Bege', 2016, 'Esportivo compacto', 36, 'Câmbio Automático', 'Diesel S-10', 'R$251.300,00', '90 dias', 'Dobló'),
(12, 'Branco fantasma', 2015, 'SUV grande', 37, 'CVT', 'Diesel S-10', 'R$832.915,00', '60 dias', 'Golf'),
(13, 'Caramelho', 2014, 'SUV compacto', 38, 'Câmbio Manual', 'Gasolina premium', 'R$242.887,00', '60 dias', 'Polo Sedan'),
(14, 'Carmesim', 2017, 'Familiar grande', 39, 'Câmbio Manual', 'Diesel S-10', 'R$393.500,00', '60 dias', 'Palio Weekend'),
(15, 'Ciano', 2019, 'Picape compacta', 40, 'Câmbio Manual', 'GNV', 'R$907.427,00', '60 dias', 'Livina'),
(16, 'Cereja', 2018, 'Picape média', 41, 'Câmbio Manual', 'Diesel comum', 'R$955.033,00', '60 dias', 'Fluence'),
(17, 'Cinza adósia escuro', 2015, 'Picape grande', 42, 'Câmbio Manual', 'Eletricidade', 'R$516.743,00', '90 dias', 'Bravo'),
(18, 'Cinza claro', 2016, 'Esportivo grande', 43, 'CVT', 'Gasolina comum', 'R$356.221,00', '90 dias', '500'),
(19, 'Cinza escuro', 2013, 'Conversível compacto', 44, 'CVT', 'Etanol aditivado', 'R$822.520,00', '90 dias', 'New Fiesta'),
(20, 'Creme de menta', 2014, 'Conversível médio', 45, 'CVT', 'Gasolina comum', 'R$921.763,00', '90 dias', 'Jetta'),
(21, 'Dainise', 2017, 'Conversível grande', 46, 'Câmbio Automático', 'Gasolina comum', 'R$208.924,00', '90 dias', 'C3 Picasso'),
(22, 'Dourado', 2018, 'Van média', 47, 'CVT', 'Eletricidade', 'R$574.804,00', '120 dias', 'Etios Sedan'),
(23, 'Ébano', 2019, 'Jipe', 48, 'Câmbio Automático', 'GNV', 'R$814.698,00', '120 dias', 'Polo'),
(24, 'Dourado pálido', 2015, 'Furgão compacto', 49, 'Câmbio Manual', 'Diesel comum', 'R$706.562,00', '120 dias', 'Focus Sedan'),
(25, 'Escarlate', 2016, 'Furgão médio', 50, 'CVT', 'Eletricidade', 'R$546.285,00', '120 dias', '207 Sedan'),
(26, 'Esmeralda', 2013, 'Caminhão urbano', 42, 'Câmbio Automático', 'Eletricidade', 'R$729.880,00', '60 dias', 'Alfa Romeo Stelvio'),
(27, 'Eucalipto', 2013, 'Jipe grande', 47, 'Câmbio Automático', 'Gasolina comum', 'R$639.823,00', '60 dias', 'Aston Martin Rapide'),
(28, 'Fandango', 2013, 'Jipe médio', 47, 'Câmbio Automático', 'Gasolina comum', 'R$870.893,00', '60 dias', 'Aston Martin Vanquish'),
(29, 'Feldspato', 2013, 'Jipe compacto', 47, 'Câmbio Automático', 'Gasolina comum', 'R$561.614,00', '60 dias', 'Aston Martin Vantage'),
(30, 'Flerte', 2013, 'Jipe subcompacto', 47, 'Câmbio Automático', 'Gasolina comum', 'R$642.549,00', '60 dias', 'Aston Martin Virage'),
(31, 'Fuligem', 2014, 'SUV grande', 47, 'Câmbio Automático', 'Gasolina comum', 'R$794.079,00', '60 dias', 'Aston Martin Vulcan'),
(32, 'Fúchsia', 2014, 'SUV médio', 47, 'Câmbio Automático', 'Diesel aditivado', 'R$894.046,00', '120 dias', 'Aston Martin Valkyrie'),
(33, 'Grená', 2014, 'SUV compacto', 40, 'Câmbio Automático', 'Diesel aditivado', 'R$208.394,00', '120 dias', 'Audi A1'),
(34, 'Gainsboro', 2014, 'SUV subcompacto', 40, 'Câmbio Automático', 'Diesel aditivado', 'R$368.270,00', '120 dias', 'Audi A2'),
(35, 'Glitter', 2014, 'Cupê grande', 40, 'Câmbio Automático', 'Diesel aditivado', 'R$296.036,00', '120 dias', 'Audi A3'),
(36, 'Goiaba', 2015, 'Cupê médio', 40, 'Câmbio Automático', 'Diesel aditivado', 'R$334.925,00', '120 dias', 'Audi A4'),
(37, 'Herbal', 2015, 'Cupê compacto', 40, 'Câmbio Manual', 'Eletricidade', 'R$867.436,00', '30 dias', 'Audi A5'),
(38, 'Heliotrópio', 2015, 'Cupê subcompacto', 40, 'Câmbio Manual', 'Eletricidade', 'R$68.270,00', '30 dias', 'Audi A6'),
(39, 'Índigo', 2015, 'Crossover grande', 40, 'Câmbio Manual', 'Eletricidade', 'R$429.367,00', '30 dias', 'Audi A7'),
(40, 'Independência', 2015, 'Crossover médio', 40, 'Câmbio Manual', 'Eletricidade', 'R$877.089,00', '30 dias', 'Audi A8'),
(41, 'Iris', 2016, 'Crossover compacto', 40, 'Câmbio Manual', 'Eletricidade', 'R$568.255,00', '30 dias', 'Audi Q2'),
(42, 'Jade', 2016, 'Crossover subcompacto', 40, 'Câmbio Manual', 'GNV', 'R$128.872,00', '30 dias', 'Audi Q3'),
(43, 'Jambo', 2016, 'Wagon grande', 40, 'Câmbio Manual', 'GNV', 'R$833.106,00', '90 dias', 'Audi Q4'),
(44, 'Jasmine', 2016, 'Wagon médio', 40, 'Câmbio Manual', 'GNV', 'R$266.583,00', '90 dias', 'Audi Q5'),
(45, 'Kiwi', 2016, 'Wagon compacto', 40, 'Câmbio Manual', 'GNV', 'R$280.960,00', '90 dias', 'Audi Q6'),
(46, 'Kobi', 2017, 'Wagon subcompacto', 40, 'Câmbio Manual', 'GNV', 'R$870.451,00', '90 dias', 'Audi Q7'),
(47, 'Kobicha', 2017, 'Conversível grande', 40, 'CVT', 'Diesel comum', 'R$78.348,00', '90 dias', 'Audi Q8'),
(48, 'Laranja', 2017, 'Conversível médio', 40, 'CVT', 'Diesel comum', 'R$949.787,00', '90 dias', 'Audi TT'),
(49, 'Lavanda', 2017, 'Conversível compacto', 40, 'CVT', 'Diesel comum', 'R$793.068,00', '180 dias', 'Audi R8'),
(50, 'Lilás', 2017, 'Conversível subcompacto', 40, 'CVT', 'Diesel comum', 'R$646.535,00', '180 dias', 'Audi e-tron'),
(51, 'Lima', 2018, 'Luxo grande', 44, 'CVT', 'Diesel comum', 'R$879.545,00', '180 dias', 'Bentley Arnage'),
(52, 'Lemon', 2018, 'Luxo médio', 44, 'CVT', 'Gasolina premium', 'R$649.204,00', '180 dias', 'Bentley Bentayga'),
(53, 'Linho', 2018, 'Luxo compacto', 44, 'CVT', 'Gasolina premium', 'R$573.485,00', '180 dias', 'Bentley Brooklands'),
(54, 'Madeira', 2018, 'Luxo subcompacto', 44, 'CVT', 'Gasolina premium', 'R$28.373,00', '180 dias', 'Bentley Continental'),
(55, 'Magenta', 2018, 'Híbrido ', 44, 'CVT', 'Gasolina premium', 'R$226.664,00', '180 dias', 'Bentley Flying Spur');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_produtos`
--

DROP TABLE IF EXISTS `tb_produtos`;
CREATE TABLE `tb_produtos` (
  `cod_produto` int(3) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `preco` float(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_produtos`
--

INSERT INTO `tb_produtos` (`cod_produto`, `descricao`, `preco`) VALUES
(1, 'Adaptador para lâmpada de Xenon', 100.00),
(2, 'Bagageiro Thule', 800.00),
(3, 'Câmera de ré', 400.00),
(4, 'Câmera Filmadora automotiva 4K', 3500.99),
(5, 'Sensor de Estacionamento Ré', 2000.00);

--
-- Acionadores `tb_produtos`
--
DROP TRIGGER IF EXISTS `tb_produtos_AFTER_UPDATE`;
DELIMITER $$
CREATE TRIGGER `tb_produtos_AFTER_UPDATE` AFTER UPDATE ON `tb_produtos` FOR EACH ROW BEGIN
IF NEW.preco <> OLD.preco  THEN
INSERT INTO tb_historico_preco_prod VALUES (NULL,NOW(),OLD.preco,NEW.preco,NEW.cod_produto);
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_servicos`
--

DROP TABLE IF EXISTS `tb_servicos`;
CREATE TABLE `tb_servicos` (
  `id_servico` int(11) NOT NULL,
  `tipo_servico` varchar(45) DEFAULT NULL,
  `id_cliente` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_servicos`
--

INSERT INTO `tb_servicos` (`id_servico`, `tipo_servico`, `id_cliente`) VALUES
(26, 'Manutenção da embreagem', 3058),
(27, 'Revisão dos componentes de freio', 2905),
(28, 'Revisão no sistema de arrefecimento', 2861),
(29, 'Troca de óleo do motor', 9060),
(30, 'Troca de óleo do câmbio automático', 7415),
(31, 'Troca de filtros', 6210),
(32, 'Troca de lâmpadas', 2012),
(33, 'Alinhamento', 6082),
(34, 'Balanceamento', 3332),
(35, 'Troca de parabrisa ', 9908),
(36, 'Troca de freio', 2203),
(37, 'Troca de pneu', 6424),
(38, 'Troca de arro ', 3983),
(39, 'Pintura', 545),
(40, 'Troca de vigia', 2832),
(41, 'Troca de vidro lateral ', 9298),
(42, 'Troca de banco', 8233),
(43, 'Troca de paineis ', 9739),
(44, 'Troca de tapete', 2247),
(45, 'Limpeza da lataria', 8398),
(46, 'Limpeza do interior', 8432),
(47, 'Troca de para-choque ', 7365),
(48, 'Troca de assoalho ', 7781),
(49, 'Troca de chassi', 3258),
(50, 'Troca de suporte do motor', 8554),
(51, 'Troca de porta', 8555),
(52, 'Checagem de porta', 8556),
(53, 'Revisão de suporte do motor', 8557),
(54, 'Troca de capo ', 8558),
(55, 'Troca de para-lama ', 8559),
(56, 'Troca de estofos ', 8560),
(57, 'Revisão de painéis ', 8561),
(58, 'Troca de paineis ', 8562),
(59, 'Troca de trava de mão', 8563),
(60, 'Checagem de transmissão', 8564),
(61, 'Troca de transmissão', 8565),
(62, 'Troca de cárter ', 8566),
(63, 'Checagem de cilindros', 8567),
(64, 'Troca de cilindros ', 8568),
(65, 'Troca da cabeça do cilindro ', 8569),
(66, 'Troca de árvore de cames ', 8570),
(67, 'Troca de cambota', 8571),
(68, 'Checagem de cambota', 8572),
(69, 'Troca de braços', 8573),
(70, 'Troca de pilares ', 8574),
(71, 'Troca de válvulas de admissão', 8575),
(72, 'Troca de válvulas de escape', 8576),
(73, 'Troca de faróis ', 8577),
(74, 'Limpeza geral ', 8578),
(75, 'Revisão geral ', 8579),
(76, 'Troca de tanque de combustível', 8580),
(77, 'Limpeza de tanque de combustível', 8581),
(78, 'Troca de assoalho da caçamba', 8582),
(79, 'Troca de assoalho da mala ', 8583),
(80, 'Checagem de chassi ', 8584);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuarios`
--

DROP TABLE IF EXISTS `tb_usuarios`;
CREATE TABLE `tb_usuarios` (
  `id_usuario` int(7) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `senha` varchar(45) NOT NULL,
  `confirmar_senha` varchar(45) NOT NULL,
  `status_perfil` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_usuarios`
--

INSERT INTO `tb_usuarios` (`id_usuario`, `nome`, `senha`, `confirmar_senha`, `status_perfil`, `email`) VALUES
(4127, 'Miguel Silva', 'eae0dbc6728d2aa9692ce7800dd14e8c', 'eae0dbc6728d2aa9692ce7800dd14e8c', 'fornecedor', 'miguelsilva@gmail.com'),
(4130, 'Arthur Santos', '7e2ad7d4a99e7356909309509ab53a88', '7e2ad7d4a99e7356909309509ab53a88', 'cliente', 'arthursantos@gmail.com'),
(4131, 'Heitor Oliveira', '32355ef7207f6075a673bbc1e6bcc0ba', '32355ef7207f6075a673bbc1e6bcc0ba', 'cliente', 'heitoroliveira@gmail.com'),
(4132, 'Helena Souza', '44742d249024a51e5ba8f8cf6cae3aed', '44742d249024a51e5ba8f8cf6cae3aed', 'cliente', 'helenasouza@gmail.com'),
(4133, 'Alice Rodrigues', '00f2b75365063b20ed9ab4de497c84f8', '00f2b75365063b20ed9ab4de497c84f8', 'gerente', 'alicerodrigues@gmail.com'),
(4134, 'Theo Ferreira', 'f0249d23bddafe80038efec5e7f34ab4', 'f0249d23bddafe80038efec5e7f34ab4', 'fornecedor', 'theoferreira@gmail.com'),
(4135, 'Davi Alves', '8e0cb46b3e97735d296236dc9663738d', '8e0cb46b3e97735d296236dc9663738d', 'cliente', 'davialves@gmail.com'),
(4136, 'Laura Pereira', '71bd98e1c08ed851a61d52c5f956812d', '71bd98e1c08ed851a61d52c5f956812d', 'fornecedor', 'laurapereira@gmail.com'),
(4137, 'Gabriel Lima', 'de0781f162dae492c2fa5436998e3550', 'de0781f162dae492c2fa5436998e3550', 'fornecedor', 'gabriellima@gmail.com'),
(4138, NULL, '', '', '', ''),
(4139, 'Gael Gomes', '333cc4a20579ada3335f0d614f413fd3', '333cc4a20579ada3335f0d614f413fd3', 'cliente', 'gaelgomes@gmail.com'),
(4140, 'Bernardo Ribeiro', '3ad517cb2513e3e2fd1b0ded738e8edf', '53c8f717640457e6a6d74c7feb1e87c2', 'cliente', 'bernardoribeiro@gmail.com'),
(4141, 'Samuel Martins', '701f5d44997731af2febc801dd9167e6', '701f5d44997731af2febc801dd9167e6', 'cliente', 'samuelmartins@gmail.com'),
(4142, 'Valentina Souza', '0a97f1ef3a831a078e4ac0f4d53ffd4c', '0a97f1ef3a831a078e4ac0f4d53ffd4c', 'gerente', 'valentinasouza@gmail.com'),
(4143, 'João Oliveira', '626e2eb2929097bf9a7238da6f2d53e4', '626e2eb2929097bf9a7238da6f2d53e4', 'cliente', 'joaooliveira@hotmail.com'),
(4144, 'Enzo Lima', '48ed1d93ecb4cec400b116155e806352', '48ed1d93ecb4cec400b116155e806352', 'cliente', 'enzolima@hotmail.com'),
(4145, 'Heloísa Ferreira', '73ec443dd197b12e5e80ead7bed1c7db', '73ec443dd197b12e5e80ead7bed1c7db', 'cliente', 'heloisaferreira@hotmail.com'),
(4146, 'Pedro Rodrigues', 'fcf8f97846c36c45d435fbc89e929a90', 'fcf8f97846c36c45d435fbc89e929a90', 'cliente', 'pedrorodrigues@hotmail.com'),
(4147, 'Lorenzo Henrique', '2f083636b93b1b80c6c6c8b67c8615d9', '2f083636b93b1b80c6c6c8b67c8615d9', 'cliente', 'lorenzohenrique@hotmail.com'),
(4148, 'Sophia Alves', '9811006b99cb748815ded6fcaa435547', '9811006b99cb748815ded6fcaa435547', 'cliente', 'sophiaalves@hotmail.com'),
(4149, 'Maria Silva', '05136fffecaa20d8d901cb52c42ebe7c', '05136fffecaa20d8d901cb52c42ebe7c', 'gerente', 'mariasilva@hotmail.com'),
(4150, 'Lorena Santos', '58b42ff94af8fbb75d293564bd54d023', '58b42ff94af8fbb75d293564bd54d023', 'cliente', 'lorenasantos@hotmail.com'),
(4151, 'Lucas Pereira', 'f7de17f90b7425f79a3924cc210a6f5c', 'f7de17f90b7425f79a3924cc210a6f5c', 'cliente', 'lucaspereira@hotmail.com'),
(4152, 'Manuela Ribeiro', 'a1df5c25dabb945d03f5300ab4324f48', 'a1df5c25dabb945d03f5300ab4324f48', 'cliente', 'manuelaribeiro@hotmail.com'),
(4153, 'Cecília Gomes', '39680377e87b31cc762f25059dfc1631', '39680377e87b31cc762f25059dfc1631', 'cliente', 'ceciliagomes@hotmail.com'),
(4154, 'Benício Martins ', 'b51b20a0d7a7c685d3f998e9ffb8627b', 'b51b20a0d7a7c685d3f998e9ffb8627b', 'gerente', 'beniciomartins@hotmail.com'),
(4155, 'Júlia Henrique', '4caff6d673dd60c93be0005666a24e91', '4caff6d673dd60c93be0005666a24e91', 'gerente', 'juliahenrique@hotmail.com'),
(4185, 'Heloise Mirella de Paula', 'e9b3e01d45289b1a5140bcbc1f42a799', 'e9b3e01d45289b1a5140bcbc1f42a799', 'cliente', 'heloisemirellade@gmail.com'),
(4236, 'Severino Guilherme Jesus', '6b905491fe4932cb8a6cdfe99bcc84c8', '6b905491fe4932cb8a6cdfe99bcc84c8', 'gerente', 'severinoguilherme@gmail.com'),
(4237, 'Severino Guilherme Jesus', '6b905491fe4932cb8a6cdfe99bcc84c8', '6b905491fe4932cb8a6cdfe99bcc84c8', 'gerente', 'severinoguilherme@gmail.com'),
(4238, 'Caio Diogo João Moreira', 'd33beff2be7bfea4d22d00c9a2ccc5fc', 'd33beff2be7bfea4d22d00c9a2ccc5fc', 'gerente', 'caiodiogojoão@gmail.com'),
(4239, 'Isabella Rosa da Conceição', 'a1a2cd1584c26362f6ad8d05e2d08c90', 'a1a2cd1584c26362f6ad8d05e2d08c90', 'gerente', 'isabellarosada@gmail.com'),
(4240, 'Beatriz Giovana Alves', 'f6dfd431b9be0d772a037e36dccf19b8', 'f6dfd431b9be0d772a037e36dccf19b8', 'gerente', 'beatrizgiovana@gmail.com'),
(4241, 'Mateus Thiago Campos', 'b6a7aede0b10c174b4b4a14fc024ceca', 'b6a7aede0b10c174b4b4a14fc024ceca', 'gerente', 'mateusthiago@gmail.com'),
(4242, 'Oliver Diogo Sales', '520aaccb2b5baa43b1086839d467e0cf', '520aaccb2b5baa43b1086839d467e0cf', 'fornecedor', 'oliverdiogo@gmail.com'),
(4243, 'Marcelo Leonardo Vieira', 'cbc5c0522ebc30abe9e3a0b42d4c2ffa', 'cbc5c0522ebc30abe9e3a0b42d4c2ffa', 'fornecedor', 'marceloleonardo@gmail.com'),
(4244, 'Juliana Brenda Marcela Ribeiro', '79367bfc42a0aea4f24324717c8d9da1', '79367bfc42a0aea4f24324717c8d9da1', 'fornecedor', 'julianabrendamarcela@gmail.com'),
(4245, 'Luana Eliane da Costa', '23891604c55f2cd115b6b2a9999aec30', '23891604c55f2cd115b6b2a9999aec30', 'fornecedor', 'luanaelianeda@gmail.com'),
(4246, 'Luís Levi Assis', '41197f03c20cb90a5fa7c50124ed2713', '41197f03c20cb90a5fa7c50124ed2713', 'fornecedor', 'luíslevi@gmail.com'),
(4247, 'Gustavo Elias Bento da Mata', '58684ad05ab0f55cb89983d40f3280e6', '58684ad05ab0f55cb89983d40f3280e6', 'fornecedor', 'gustavoeliasbentoda@gmail.com'),
(4248, 'João Leonardo Erick Ribeiro', '76b3d366157fa978255aa4321850c26c', '76b3d366157fa978255aa4321850c26c', 'fornecedor', 'joãoleonardoerick@gmail.com'),
(4249, 'Isabela Luciana da Mota', '0ca865a2c5eaacc9c98ebb0f7afb5a68', '0ca865a2c5eaacc9c98ebb0f7afb5a68', 'fornecedor', 'isabelalucianada@gmail.com'),
(4250, 'Caleb Gustavo Jesus', 'f6df3d712f2938b358b493f06c1ba1ff', 'f6df3d712f2938b358b493f06c1ba1ff', 'fornecedor', 'calebgustavo@gmail.com'),
(4251, 'Erick Márcio Diogo Cavalcanti', '7cc68e2e08847d28179c39e52077e292', '7cc68e2e08847d28179c39e52077e292', 'fornecedor', 'erickmárciodiogo@gmail.com'),
(4252, 'Luiz Leandro Barros', '312b304c9284cde198aac7ce1d3ea8b7', '312b304c9284cde198aac7ce1d3ea8b7', 'cliente', 'luizleandro@gmail.com'),
(4253, 'Juan Sebastião Gonçalves', 'e8554901208adff9be6240ad28ba4451', 'e8554901208adff9be6240ad28ba4451', 'cliente', 'juansebastião@gmail.com'),
(4254, 'Carla Daniela Teixeira', '05e02174216fddc48155a520c68a03e0', '05e02174216fddc48155a520c68a03e0', 'cliente', 'carladaniela@gmail.com'),
(4255, 'Rayssa Luna Francisca da Conceição', 'b7a54bdfc958388ddc92a2c42fced223', 'b7a54bdfc958388ddc92a2c42fced223', 'cliente', 'rayssalunafranciscada@gmail.com'),
(4256, 'Bianca Benedita Bernardes', '4caa99630bc0b58adf4805f63e381778', '4caa99630bc0b58adf4805f63e381778', 'cliente', 'biancabenedita@gmail.com'),
(4257, 'Renan Thomas Gomes', 'a8ea9a1a1e8768796fd4c996e4f97734', 'a8ea9a1a1e8768796fd4c996e4f97734', 'cliente', 'renanthomas@gmail.com'),
(4258, 'Daiane Fernanda Alice Baptista', 'dbd1f6ac82149c9beae1141dc4e51bd6', 'dbd1f6ac82149c9beae1141dc4e51bd6', 'cliente', 'daianefernandaalice@gmail.com'),
(4259, 'Iago Benedito da Cruz', '4ad2e75b2b28cbf75b687af09fcf20e4', '4ad2e75b2b28cbf75b687af09fcf20e4', 'cliente', 'iagobeneditoda@gmail.com'),
(4260, 'Julia Jéssica Sara Moura', '7697c00db8641c0aa939f12b95728799', '7697c00db8641c0aa939f12b95728799', 'cliente', 'juliajéssicasara@gmail.com'),
(4261, 'Raimundo Gael Sebastião Melo', '98edd9016ada8d92997c131baa911a42', '98edd9016ada8d92997c131baa911a42', 'cliente', 'raimundogaelsebastião@gmail.com'),
(4262, 'Ryan Eduardo Danilo Nunes', '72ae5e9a3e75788f6865290ac2e5e561', '72ae5e9a3e75788f6865290ac2e5e561', 'cliente', 'ryaneduardodanilo@gmail.com'),
(4263, 'Mariane Tatiane Nunes', '23e839e124c6c1b75130b9e3a9ececf1', '23e839e124c6c1b75130b9e3a9ececf1', 'cliente', 'marianetatiane@gmail.com'),
(4264, 'Natália Cecília Ramos', '6fbdc7e6cdca101e541b175612273247', '6fbdc7e6cdca101e541b175612273247', 'cliente', 'natáliacecília@gmail.com'),
(4265, 'Raimunda Cecília Araújo', '4a8a4cec2b5dcf8432bae489e97a7fe6', '4a8a4cec2b5dcf8432bae489e97a7fe6', 'cliente', 'raimundacecília@gmail.com'),
(4266, 'Raul Carlos Nathan Almeida', 'f082c210f24a975980c8a8bcac064a1e', 'f082c210f24a975980c8a8bcac064a1e', 'cliente', 'raulcarlosnathan@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_vendas`
--

DROP TABLE IF EXISTS `tb_vendas`;
CREATE TABLE `tb_vendas` (
  `id_vendas` int(11) NOT NULL,
  `lucrobruto` varchar(55) DEFAULT NULL,
  `imposto` varchar(55) DEFAULT NULL,
  `receita` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_vendas`
--

INSERT INTO `tb_vendas` (`id_vendas`, `lucrobruto`, `imposto`, `receita`) VALUES
(1, 'R$456.496,00', 'R$45.649,60', 'R$410.846,40'),
(2, 'R$999.243,00', 'R$99.924,30', 'R$899.318,70'),
(3, 'R$404.415,00', 'R$40.441,50', 'R$363.973,50'),
(4, 'R$770.390,00', 'R$77.039,00', 'R$693.351,00'),
(5, 'R$309.425,00', 'R$30.942,50', 'R$278.482,50'),
(6, 'R$259.723,00', 'R$25.972,30', 'R$233.750,70'),
(7, 'R$24.301,00', 'R$2.430,10', 'R$21.870,90'),
(8, 'R$250.172,00', 'R$25.017,20', 'R$225.154,80'),
(9, 'R$933.017,00', 'R$93.301,70', 'R$839.715,30'),
(10, 'R$144.732,00', 'R$14.473,20', 'R$130.258,80'),
(11, 'R$311.523,00', 'R$31.152,30', 'R$280.370,70'),
(12, 'R$353.069,00', 'R$35.306,90', 'R$317.762,10'),
(13, 'R$775.178,00', 'R$77.517,80', 'R$697.660,20'),
(14, 'R$62.476,00', 'R$6.247,60', 'R$56.228,40'),
(15, 'R$441.954,00', 'R$44.195,40', 'R$397.758,60'),
(16, 'R$879.498,00', 'R$87.949,80', 'R$791.548,20'),
(17, 'R$637.041,00', 'R$63.704,10', 'R$573.336,90'),
(18, 'R$569.169,00', 'R$56.916,90', 'R$512.252,10'),
(19, 'R$696.878,00', 'R$69.687,80', 'R$627.190,20'),
(20, 'R$617.075,00', 'R$61.707,50', 'R$555.367,50'),
(21, 'R$567.445,00', 'R$56.744,50', 'R$510.700,50'),
(22, 'R$516.581,00', 'R$51.658,10', 'R$464.922,90'),
(23, 'R$209.057,00', 'R$20.905,70', 'R$188.151,30'),
(24, 'R$624.058,00', 'R$62.405,80', 'R$561.652,20'),
(25, 'R$789.846,00', 'R$78.984,60', 'R$710.861,40'),
(26, 'R$438.382,00', 'R$43.838,20', 'R$394.543,80'),
(27, 'R$559.372,00', 'R$55.937,20', 'R$503.434,80'),
(28, 'R$684.233,00', 'R$68.423,30', 'R$615.809,70'),
(29, 'R$800.432,00', 'R$80.043,20', 'R$720.388,80'),
(30, 'R$998.300,00', 'R$99.830,00', 'R$898.470,00'),
(31, 'R$360.500,00', 'R$36.050,00', 'R$324.450,00'),
(32, 'R$30.780,00', 'R$3.078,00', 'R$27.702,00'),
(33, 'R$240.567,00', 'R$24.056,70', 'R$216.510,30'),
(34, 'R$500.840,00', 'R$50.084,00', 'R$450.756,00'),
(35, 'R$257.987,00', 'R$25.798,70', 'R$232.188,30'),
(36, 'R$180.460,00', 'R$18.046,00', 'R$162.414,00'),
(37, 'R$670.362,00', 'R$67.036,20', 'R$603.325,80'),
(38, 'R$870.570,00', 'R$87.057,00', 'R$783.513,00'),
(39, 'R$638.954,00', 'R$63.895,40', 'R$575.058,60'),
(40, 'R$80.965,00', 'R$8.096,50', 'R$72.868,50'),
(41, 'R$20.870,00', 'R$2.087,00', 'R$18.783,00'),
(42, 'R$956.000,00', 'R$95.600,00', 'R$860.400,00'),
(43, 'R$98.000,00', 'R$9.800,00', 'R$88.200,00'),
(44, 'R$60.854,00', 'R$6.085,40', 'R$54.768,60'),
(45, 'R$789.547,00', 'R$78.954,70', 'R$710.592,30'),
(46, 'R$623.124,00', 'R$62.312,40', 'R$560.811,60'),
(47, 'R$25.890,00', 'R$2.589,00', 'R$23.301,00'),
(48, 'R$59.457,00', 'R$5.945,70', 'R$53.511,30'),
(49, 'R$375.678,00', 'R$37.567,80', 'R$338.110,20'),
(50, 'R$87.386,00', 'R$8.738,60', 'R$78.647,40'),
(51, 'R$537.000,00', 'R$53.700,00', 'R$483.300,00'),
(52, 'R$123.456,00', 'R$12.345,60', 'R$111.110,40'),
(53, 'R$846.913,00', 'R$84.691,30', 'R$762.221,70'),
(54, 'R$936.579,00', 'R$93.657,90', 'R$842.921,10'),
(55, 'R$74.869,00', 'R$7.486,90', 'R$67.382,10');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_categoria`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `vw_categoria`;
CREATE TABLE `vw_categoria` (
`codigo_categoria` int(11)
,`categoria` varchar(45)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_cliente_servico`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `vw_cliente_servico`;
CREATE TABLE `vw_cliente_servico` (
`nome` longtext
,`contato` varchar(45)
,`tipo_servico` varchar(45)
,`id_cliente` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_servicos_concessionarias`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `vw_servicos_concessionarias`;
CREATE TABLE `vw_servicos_concessionarias` (
`tipo_servico` varchar(45)
,`cod_concessionaria` int(3)
);

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_categoria`
--
DROP TABLE IF EXISTS `vw_categoria`;

DROP VIEW IF EXISTS `vw_categoria`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_categoria`  AS SELECT `tb_categoria`.`codigo_categoria` AS `codigo_categoria`, `tb_categoria`.`categoria` AS `categoria` FROM `tb_categoria` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_cliente_servico`
--
DROP TABLE IF EXISTS `vw_cliente_servico`;

DROP VIEW IF EXISTS `vw_cliente_servico`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_cliente_servico`  AS SELECT `tc`.`nome` AS `nome`, `tc`.`contato` AS `contato`, `ts`.`tipo_servico` AS `tipo_servico`, `tc`.`id_cliente` AS `id_cliente` FROM (`tb_clientes` `tc` join `tb_servicos` `ts`) WHERE `tc`.`id_cliente` = `ts`.`id_cliente` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_servicos_concessionarias`
--
DROP TABLE IF EXISTS `vw_servicos_concessionarias`;

DROP VIEW IF EXISTS `vw_servicos_concessionarias`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_servicos_concessionarias`  AS SELECT `tb_servicos`.`tipo_servico` AS `tipo_servico`, `tb_concessionarias`.`cod_concessionaria` AS `cod_concessionaria` FROM (`tb_servicos` join `tb_concessionarias`) ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_categoria`
--
ALTER TABLE `tb_categoria`
  ADD PRIMARY KEY (`codigo_categoria`);

--
-- Índices para tabela `tb_clientes`
--
ALTER TABLE `tb_clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `tb_concessionarias`
--
ALTER TABLE `tb_concessionarias`
  ADD PRIMARY KEY (`cod_concessionaria`);

--
-- Índices para tabela `tb_fornecedores`
--
ALTER TABLE `tb_fornecedores`
  ADD PRIMARY KEY (`id_fornecedor`);

--
-- Índices para tabela `tb_frequencia`
--
ALTER TABLE `tb_frequencia`
  ADD PRIMARY KEY (`registro_funcionario`);

--
-- Índices para tabela `tb_funcionarios`
--
ALTER TABLE `tb_funcionarios`
  ADD PRIMARY KEY (`id_funcionario`);

--
-- Índices para tabela `tb_historico_preco_prod`
--
ALTER TABLE `tb_historico_preco_prod`
  ADD PRIMARY KEY (`cod_hist`),
  ADD KEY `cod_produto` (`cod_produto`);

--
-- Índices para tabela `tb_marcas`
--
ALTER TABLE `tb_marcas`
  ADD PRIMARY KEY (`id_marca`);

--
-- Índices para tabela `tb_modelos_novos`
--
ALTER TABLE `tb_modelos_novos`
  ADD PRIMARY KEY (`idmodelo_novo`),
  ADD KEY `id_marca_idx` (`id_marca`);

--
-- Índices para tabela `tb_modelos_seminovos`
--
ALTER TABLE `tb_modelos_seminovos`
  ADD PRIMARY KEY (`idmodelo_seminovo`),
  ADD KEY `id_marca_idx` (`id_marca`);

--
-- Índices para tabela `tb_produtos`
--
ALTER TABLE `tb_produtos`
  ADD PRIMARY KEY (`cod_produto`);

--
-- Índices para tabela `tb_servicos`
--
ALTER TABLE `tb_servicos`
  ADD PRIMARY KEY (`id_servico`);

--
-- Índices para tabela `tb_usuarios`
--
ALTER TABLE `tb_usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Índices para tabela `tb_vendas`
--
ALTER TABLE `tb_vendas`
  ADD PRIMARY KEY (`id_vendas`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_categoria`
--
ALTER TABLE `tb_categoria`
  MODIFY `codigo_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de tabela `tb_clientes`
--
ALTER TABLE `tb_clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de tabela `tb_concessionarias`
--
ALTER TABLE `tb_concessionarias`
  MODIFY `cod_concessionaria` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=945;

--
-- AUTO_INCREMENT de tabela `tb_fornecedores`
--
ALTER TABLE `tb_fornecedores`
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=846;

--
-- AUTO_INCREMENT de tabela `tb_frequencia`
--
ALTER TABLE `tb_frequencia`
  MODIFY `registro_funcionario` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT de tabela `tb_funcionarios`
--
ALTER TABLE `tb_funcionarios`
  MODIFY `id_funcionario` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT de tabela `tb_historico_preco_prod`
--
ALTER TABLE `tb_historico_preco_prod`
  MODIFY `cod_hist` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_marcas`
--
ALTER TABLE `tb_marcas`
  MODIFY `id_marca` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de tabela `tb_modelos_novos`
--
ALTER TABLE `tb_modelos_novos`
  MODIFY `idmodelo_novo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT de tabela `tb_modelos_seminovos`
--
ALTER TABLE `tb_modelos_seminovos`
  MODIFY `idmodelo_seminovo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de tabela `tb_servicos`
--
ALTER TABLE `tb_servicos`
  MODIFY `id_servico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de tabela `tb_usuarios`
--
ALTER TABLE `tb_usuarios`
  MODIFY `id_usuario` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4267;

--
-- AUTO_INCREMENT de tabela `tb_vendas`
--
ALTER TABLE `tb_vendas`
  MODIFY `id_vendas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_historico_preco_prod`
--
ALTER TABLE `tb_historico_preco_prod`
  ADD CONSTRAINT `tb_historico_preco_prod_ibfk_1` FOREIGN KEY (`cod_produto`) REFERENCES `tb_produtos` (`cod_produto`);

--
-- Limitadores para a tabela `tb_modelos_novos`
--
ALTER TABLE `tb_modelos_novos`
  ADD CONSTRAINT `id_marca` FOREIGN KEY (`id_marca`) REFERENCES `tb_marcas` (`id_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_modelos_seminovos`
--
ALTER TABLE `tb_modelos_seminovos`
  ADD CONSTRAINT `fk_id_marca` FOREIGN KEY (`id_marca`) REFERENCES `tb_marcas` (`id_marca`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
