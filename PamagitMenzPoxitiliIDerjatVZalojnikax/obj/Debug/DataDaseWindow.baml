   M S B A M L   `   `   `  ����`  \PamagitMenzPoxitiliIDerjatVZalojnikax, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]3clr-namespace:PamagitMenzPoxitiliIDerjatVZalojnikax%PamagitMenzPoxitiliIDerjatVZalojnikax  5   	   :    4PamagitMenzPoxitiliIDerjatVZalojnikax.DataDaseWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Elocal3clr-namespace:PamagitMenzPoxitiliIDerjatVZalojnikax     5   	     � Title$  DataDaseWindow��5   	   $	��450��6    $	��800��6-   .��5	      � .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ Reqst��5   /      AutoGenerateColumns .  $��1��6>      
IsReadOnly .    GridLinesVisibility$
 None=�6]      Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ 	StartDate��6%   1  +System.Windows.Controls.DataGridBoundColumn   Binding 68   �� *	StartDate+  5      $ TechType��6%    67   �� *TechType.Name+  5      $ TechType��6%    67   �� *Description+5      �� 5   
   -   5         ��Name$ CreateButton��5      $��Create��6'   $
��Left=�68   $��
32,363,0,0q�6S   $	��Top=�6g   $��44��6   $	��140��6�   6�   �� 5   
   -   5        $ Update��5      $��Update��6!   $
��Left=�62   $��197,363,0,0q�6M   $	��Top=�6b   $��44��6z   $	��140��6�   6�   �� 5   
   -   5        $ Delete��5      $��Delete��6!   $
��Left=�62   $��371,363,0,0q�6M   $	��Top=�6b   $��44��6z   $	��140��6�   6�   �� 5   
   -   5        $
 Exti��5      $
��Exit��6   $
��Left=�6.   $��634,363,0,0q�6I   $	��Top=�6^   $��44��6v   $	��140��6�   6�   5      5      