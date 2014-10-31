package STO;
//---------------------------------------------------------------------
//
//---------------------------------------------------------------------

import java.util.Vector;

import STO.STO;

public class Scope
{
	private Vector<STO> m_lstLocals;

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public Scope()
	{
		m_lstLocals = new Vector<STO>();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public STO access(String strName)
	{
		return accessLocal(strName);
	}
	
	public Vector<STO> accessAll() {
		return this.m_lstLocals;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public STO accessLocal(String strName)
	{
		STO sto = null;

		for (int i = 0; i < m_lstLocals.size(); i++)
		{
			sto = m_lstLocals.elementAt(i);

			if (sto.getName().equals(strName))
				return sto;
		}

		return null;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public void InsertLocal(STO sto)
	{
		m_lstLocals.addElement(sto);
	}
}
